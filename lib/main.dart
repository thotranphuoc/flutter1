import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './pages/auth.dart';

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
        debugShowMaterialGrid: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepPurple),
        home: AuthPage());
  }
}
