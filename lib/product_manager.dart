import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  ProductManager(this.startingProduct) {
    print('[ProductManager] constructor()');
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print('[ProductManager] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];
  @override
  void initState() {
    // TODO: implement initState
    print('[ProductManagerState] initState()');
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    // TODO: implement didUpdateWidget
    print('[ProductManagerState] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('[ProductManagerState] build()');
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                _products.add('New Food Tester');
                // print(_products);
              });
            },
            child: Text('Add New'),
          ),
        ),
        Products(_products)
      ],
    );
  }
}
