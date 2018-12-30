import 'package:flutter/material.dart';
import './product_card.dart';
import '../../models/product.model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/product.scope.dart';

class Products extends StatelessWidget {
  // final List<iProduct> products;
  // // final Function deleteProduct;
  // // products: required, deleteProduct: optional
  // Products(this.products);

  List<iProduct> _products = [];

  @override
  Widget build(BuildContext context) {
    print('product.dart build()');
    return _buildScope();
  }

  ScopedModelDescendant _buildScope() {
    return ScopedModelDescendant<ProductScopedModel>(
      builder: (BuildContext context, Widget child, ProductScopedModel model) {
        _products = model.products;
        return _buildProductList(model.products);
      },
    );
  }

  // Widget _buildProductItem(BuildContext context, int index) {
  //   return ProductCard(products[index], index);
  // }

  Widget _buildProductList(List<iProduct> products) {
    Widget productListWidget;
    if (products.isNotEmpty) {
      productListWidget = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productListWidget =
          Container(); // could be an empty container. Empty container doesn't consump any pixel
    }

    return productListWidget;
  }
}
