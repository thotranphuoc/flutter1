import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  // get the input and assign to products
  Products(this.products) {
    print('product.dart constructor()');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('product.dart build()');
    return Column(
      children: products
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/dalat.jpg'),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
