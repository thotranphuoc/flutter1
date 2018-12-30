import 'package:flutter/material.dart';

class iProduct {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  iProduct(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl});
}
