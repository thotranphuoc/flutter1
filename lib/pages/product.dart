import 'dart:async';
import 'package:flutter/material.dart';

// import '../product_manager.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  ProductPage(this.title, this.imageUrl);

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
              Text(title),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('DELETE'),
                onPressed: () => _showWarningDialog(context),
              )
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
