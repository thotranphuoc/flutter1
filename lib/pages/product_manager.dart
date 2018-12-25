import 'package:flutter/material.dart';
import './products.dart';

class ProductManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Manager'),
        ),
        body: Center(
            child: RaisedButton(
                child: Text('Some product here'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductsPage()));
                })));
  }
}
