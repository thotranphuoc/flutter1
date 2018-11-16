import 'package:flutter/material.dart';

// main function generally does not receive any
// main doest return anything
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // it tells that build function override all from StatelessWidget
  // build() return a widget
  // input of build() should be a BuildContext
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
            RaisedButton(
              onPressed: () {},
              child: Text('Add New'),
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
