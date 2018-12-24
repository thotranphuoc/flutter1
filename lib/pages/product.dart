import 'package:flutter/material.dart';
// import '../product_manager.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(imageUrl),
            Text(title),
            RaisedButton(
              child: Text('DELETE'),
              onPressed: () => Navigator.pop(context, true),
            )
          ],
        ));
  }
}
