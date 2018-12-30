import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  ProductListPage(this.products);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('List of Products'),
    );
  }
}
