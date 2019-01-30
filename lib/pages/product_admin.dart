import 'package:flutter/material.dart';
// import './products.dart';

import './product_edit.dart';
import './product_list.dart';
import '../models/product.model.dart';

class ProductAdminPage extends StatelessWidget {
  // final Function(iProduct) addProduct;
  // final Function(int, iProduct) updateProduct;
  // final Function(int) deleteProduct;
  // final List<iProduct> products;
  // ProductAdminPage(
  //     this.addProduct, this.updateProduct, this.deleteProduct, this.products);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
            title: Text('Product Admin'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create Product',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My Products',
                )
              ],
            )),
        body: TabBarView(
          children: <Widget>[ProductEditPage(), ProductListPage()],
        ),
      ),
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
            leading: Icon(Icons.shop),
            title: Text('All Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }
}
