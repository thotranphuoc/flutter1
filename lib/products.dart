import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<String> products;

  // get the input and assign to products
  Products(this.products) {
    print('product.dart constructor()');
  }

  @override
  Widget build(BuildContext context) {
    print('product.dart build()');
    return _buildProductList();
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/dalat.jpg'),
          Text(products[index]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductPage())),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productListWidget;
    if (products.isNotEmpty) {
      productListWidget = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      // productListWidget = Center(
      //   child: Text('No products found, please add some'),
      // );

      productListWidget =
          Container(); // could be an empty container. Empty container doesn't consump any pixel
    }

    return productListWidget;
  }
}
