import 'package:flutter/material.dart';
import '../widgets/products/products.dart';
import './product_admin.dart';
import '../models/product.model.dart';

class ProductsPage extends StatelessWidget {
  final List<iProduct> products;

  // should be received from outside
  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Products Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
      ),
      body: Products(products),
    );
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () => Navigator.pushNamed(context, '/admin'),
          )
        ],
      ),
    );
  }
}
