import 'package:flutter/material.dart';
import './product_edit.dart';
import '../models/product.model.dart';

class ProductListPage extends StatelessWidget {
  final List<iProduct> products;
  final Function updateProduct;
  final Function deleteProduct;
  ProductListPage(this.products, this.updateProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index].title),
          direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
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
                  backgroundImage: AssetImage(products[index].imageUrl),
                ),
                title: Text(products[index].title),
                subtitle: Text('\$${products[index].price}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider()
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage(
            product: products[index],
            updateProduct: updateProduct,
            productIndex: index,
          );
        }));
      },
      icon: Icon(Icons.edit),
    );
  }
}
