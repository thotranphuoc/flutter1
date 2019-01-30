import 'package:flutter/material.dart';
import './product_edit.dart';

import 'package:scoped_model/scoped_model.dart';
import '../models/product.model.dart';
import '../scoped-models/product.scope.dart';

class ProductListPage extends StatelessWidget {
  // final List<iProduct> products;
  // final Function updateProduct;
  // final Function deleteProduct;
  // ProductListPage(this.products, this.updateProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, ProductScopedModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.products[index].title),
              direction: DismissDirection.endToStart,
              onDismissed: (DismissDirection direction) {
                model.selectProduct(index);
                if (direction == DismissDirection.endToStart) {
                  model.deleteProduct();
                } else if (direction == DismissDirection.startToEnd) {
                  print('Swipe start to end');
                } else {
                  print('Other swiping');
                }
              },
              background: Container(
                color: Colors.red,
              ),
              // secondaryBackground: Container(
              //   color: Colors.yellow,
              // ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(model.products[index].imageUrl),
                    ),
                    title: Text(model.products[index].title),
                    subtitle: Text('\$${model.products[index].price}'),
                    trailing: _buildEditButton(context, index, model),
                  ),
                  Divider()
                ],
              ),
            );
          },
          itemCount: model.products.length,
        );
      },
    );
  }

  Widget _buildEditButton(
      BuildContext context, int index, ProductScopedModel model) {
    return IconButton(
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage();
        }));
      },
      icon: Icon(Icons.edit),
    );
  }
}
