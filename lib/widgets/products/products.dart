import 'package:flutter/material.dart';
import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  // final Function deleteProduct;
  // products: required, deleteProduct: optional
  Products(this.products);

  @override
  Widget build(BuildContext context) {
    print('product.dart build()');
    return _buildProductList();
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return ProductCard(products[index], index);
  }

  Widget _buildProductList() {
    Widget productListWidget;
    if (products.isNotEmpty) {
      productListWidget = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productListWidget =
          Container(); // could be an empty container. Empty container doesn't consump any pixel
    }

    return productListWidget;
  }
}
