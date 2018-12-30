import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  ProductListPage(this.products, this.updateProduct);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            ListTile(
              // leading: Image.asset(products[index]['imageUrl']),
              leading: CircleAvatar(
                backgroundImage: AssetImage(products[index]['imageUrl']),
              ),
              title: Text(products[index]['title']),
              subtitle: Text('\$${products[index]['price']}'),
              trailing: IconButton(
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
              ),
            ),
            Divider()
          ],
        );
      },
      itemCount: products.length,
    );
  }
}
