import 'package:flutter/material.dart';

// main function generally does not receive any
// main doest return anything
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // it tells that build function override all from StatelessWidget
  // build() return a widget
  // input of build() should be a BuildContext

  List<String> _products = ['Food Tester'];
  @override
  Widget build(BuildContext contect) {
    return MaterialApp(
      // Scaffold create a page
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyLists'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  _products.add('New Food Tester');
                  print(_products);
                },
                child: Text('Add New'),
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/dalat.jpg'),
                  Text('Dalat my love')
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/dalat.jpg'),
                  Text('Dalat my love')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
