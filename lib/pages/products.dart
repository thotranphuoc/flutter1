import 'package:flutter/material.dart';
import '../product_manager.dart';
import './product_admin.dart';

class ProductsPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;
  final List<Map<String, String>> products;

  // should be received from outside
  ProductsPage(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () => Navigator.pushNamed(context, '/admin'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('EasyLists'),
      ),
      body: ProductManager(products, addProduct, deleteProduct),
    );
  }
}
