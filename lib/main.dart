import 'package:flutter/material.dart';

import './product_manager.dart';

// main function generally does not receive any
// main doest return anything
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyLists'),
        ),
        body: ProductManager('Food tester from main.dart'),
      ),
    );
  }
}
