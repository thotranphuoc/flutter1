import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  // final Function deleteProduct;
  // products: required, deleteProduct: optional
  Products(
    this.products,
    //  {this.deleteProduct}
  ) {
    print('product.dart constructor()');
  }

  @override
  Widget build(BuildContext context) {
    print('product.dart build()');
    return _buildProductList();
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/dalat.jpg'),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    products[index]['title'],
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      '\$' + products[index]['price'].toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4.0)),
            child: Text('Union Square, San Francisco'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () => Navigator.pushNamed(
                      context, '/product/' + index.toString())
                  //     .then((onValue) {
                  //   if (onValue) {
                  //     deleteProduct(index);
                  //   }
                  // }),
                  )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productListWidget;
    if (products.isNotEmpty) {
      productListWidget = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      // productListWidget = Center(
      //   child: Text('No products found, please add some'),
      // );

      productListWidget =
          Container(); // could be an empty container. Empty container doesn't consump any pixel
    }

    return productListWidget;
  }
}
