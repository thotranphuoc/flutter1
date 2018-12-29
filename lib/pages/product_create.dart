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
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _keyForm,
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
                textColor: Colors.white,
                child: Text('Save'),
                onPressed: _submitForm,
              ),
              // GestureDetector(
              //   onTap: _submitForm,
              //   child: Container(
              //     color: Colors.green,
              //     padding: EdgeInsets.all(5.0),
              //     child: Text(
              //       'my custom button',
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      // autovalidate: true,
      validator: (String value) {
        if (value.isEmpty || value.trim().length < 5) {
          return 'Title is required and should be 5+ characters';
        }
      },
      onSaved: (String value) {
        print('Title field saved ->' + value);
        setState(() {
          _titleValue = value;
        });
      },
      // onChanged: (String value) {
      //   print(value);
      //   setState(() {
      //     _titleValue = value;
      //   });
      // },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      validator: (String value) {
        if (value.isEmpty || value.trim().length < 10) {
          return 'Description is required and should be 10+ characters';
        }
      },
      onSaved: (String value) {
        print('Desc field saved ->' + value);
        setState(() {
          _descValue = value;
        });
      },
      // onChanged: (String value) {
      //   print(value);
      //   setState(() {
      //     _descValue = value;
      //   });
      // },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      onSaved: (String value) {
        print('Price field saved ->' + value);
        setState(() {
          _priceValue = double.parse(value);
        });
      },
      // onChanged: (String value) {
      //   print(value);
      //   setState(() {
      //     _priceValue = double.parse(value);
      //   });
      // },
    );
  }

  void _submitForm() {
    if (!_keyForm.currentState.validate()) {
      return;
    }
    ;
    _keyForm.currentState.save();
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
