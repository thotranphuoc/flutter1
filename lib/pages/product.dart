import 'dart:async';
import 'package:flutter/material.dart';

// import '../product_manager.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  ProductPage(this.title, this.imageUrl, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Details'),
          ),
          body: Column(
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(title,
                    style: TextStyle(
                        fontSize: 26.0,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Union Square, San Francisco',
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text('|'),
                  ),
                  Text(
                    '\$' + price.toString(),
                    style: TextStyle(fontFamily: 'Oswald'),
                  )
                ],
              ),
              // Text(description),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Chocolate is a usually sweet, brown food preparation of roasted and ground cacao seeds. It is made in the form of a liquid, paste, or in a block, or used as a flavoring ingredient in other foods.',
                  textAlign: TextAlign.justify,
                ),
              ),
              // RaisedButton(
              //   color: Theme.of(context).accentColor,
              //   child: Text('DELETE'),
              //   onPressed: () => _showWarningDialog(context),
              // )
            ],
          )),
    );
  }

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }
}
