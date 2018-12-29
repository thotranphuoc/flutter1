import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descValue;
  double _priceValue;
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            // color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('Save'),
            onPressed: _submitForm,
          )
        ],
      ),
    );
  }

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onChanged: (String value) {
        print(value);
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      onChanged: (String value) {
        print(value);
        setState(() {
          _descValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      onChanged: (String value) {
        print(value);
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descValue,
      'price': _priceValue,
      'imageUrl': 'assets/dalat.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }
}
