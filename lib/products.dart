import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  // get the input and assign to products
  Products(this.products) {
    print('product.dart constructor()');
  }

  @override
  Widget build(BuildContext context) {
    print('product.dart build()');
    return ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: products.length,
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/dalat.jpg'),
          Text(products[index])
        ],
      ),
    );
  }
}
