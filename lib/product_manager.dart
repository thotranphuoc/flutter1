import 'package:flutter/material.dart';
import './products.dart';
// import './product_control.dart';

class ProductManager extends StatelessWidget {
  // final Function addProduct;
  // final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  // should be received from outside
  ProductManager(this.products);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Container(
        //   margin: EdgeInsets.all(10.0),
        //   child: ProductControl(addProduct),
        //   // just add referenct of _addProduct function. Not (), so that not execute immediately
        // ),
        Expanded(
          child: Products(
            products,
            // deleteProduct: deleteProduct
          ),
        )
      ],
    );
  }
}
