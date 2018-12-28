import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  // final Function deleteProduct;
  // products: required, deleteProduct: optional
  Products(
    this.products,
    //  {this.deleteProduct}
  ) {
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
          Text(
            products[index]['title'],
            style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oswald'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Text(products[index]['title']),
                  onPressed: () => Navigator.pushNamed(
                      context, '/product/' + index.toString())
                  //     .then((onValue) {
                  //   if (onValue) {
                  //     deleteProduct(index);
                  //   }
                  // }),
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
