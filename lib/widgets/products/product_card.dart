import 'package:flutter/material.dart';
import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';
import '../../models/product.model.dart';

class ProductCard extends StatelessWidget {
  final iProduct product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/dalat.jpg'),
          _buildTitlePrice(),
          AddressTag('Union Square, San Francisco'),
          _buildActionButtons(context)
        ],
      ),
    );
  }

  Widget _buildTitlePrice() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(product.title),
            SizedBox(
              width: 20.0,
            ),
            PriceTag(product.price.toString()),
          ],
        ));
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.info),
            color: Theme.of(context).accentColor,
            onPressed: () => Navigator.pushNamed(
                context, '/product/' + productIndex.toString())
            //     .then((onValue) {
            //   if (onValue) {
            //     deleteProduct(index);
            //   }
            // }),
            ),
        IconButton(
            icon: Icon(Icons.favorite_border),
            color: Colors.red,
            onPressed: () => Navigator.pushNamed(
                context, '/product/' + productIndex.toString())
            //     .then((onValue) {
            //   if (onValue) {
            //     deleteProduct(index);
            //   }
            // }),
            )
      ],
    );
  }
}
