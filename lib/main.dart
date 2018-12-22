import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './product_manager.dart';


// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
  debugPaintSizeEnabled = true;
  debugPaintBaselinesEnabled = true;
  debugPaintPointersEnabled = true;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyLists'),
        ),
        body: ProductManager('Food tester from main.dart'),
      ),
    );
  }
}
