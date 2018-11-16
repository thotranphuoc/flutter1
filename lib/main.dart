import 'package:flutter/material.dart';

// main function generally does not receive any
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(contect) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyLists'),
        ),
      ),
    );
  }
}
