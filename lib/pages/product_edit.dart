import 'package:flutter/material.dart';
import '../models/product.model.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/product.scope.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'imageUrl': 'assets/dalat.jpg'
  };
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductScopedModel>(
      builder: (BuildContext context, Widget child, ProductScopedModel model) {
        final Widget pageContent =
            _buildPageContent(context, model.selectedProduct);
        return model.selectedProductIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Product'),
                ),
                body: pageContent,
              );
      },
    );
  }

  Widget _buildPageContent(BuildContext context, iProduct product) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: _keyForm,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
              children: <Widget>[
                _buildTitleTextField(product),
                _buildDescriptionTextField(product),
                _buildPriceTextField(product),
                SizedBox(
                  height: 10.0,
                ),
                _buildSubmitButton(),
              ],
            ),
          )),
    );
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<ProductScopedModel>(
      builder: (BuildContext context, Widget child, ProductScopedModel model) {
        // _products = model.products;
        return RaisedButton(
          textColor: Colors.white,
          child: Text('Save'),
          onPressed: () => _submitForm(model),
        );
      },
    );
  }

  Widget _buildTitleTextField(iProduct product) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      initialValue: product == null ? '' : product.title,
      validator: (String value) {
        if (value.isEmpty || value.trim().length < 5) {
          return 'Title is required and should be 5+ characters';
        }
      },
      onSaved: (String value) {
        print('Title field saved ->' + value);
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField(iProduct product) {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      initialValue: product == null ? '' : product.description,
      validator: (String value) {
        if (value.isEmpty || value.trim().length < 10) {
          return 'Description is required and should be 10+ characters';
        }
      },
      onSaved: (String value) {
        print('Desc field saved ->' + value);
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceTextField(iProduct product) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      initialValue: product == null ? '' : product.price.toString(),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:[.,]\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number';
        }
      },
      onSaved: (String value) {
        print('Price field saved ->' + value);
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm(ProductScopedModel model) {
    if (!_keyForm.currentState.validate()) {
      return;
    }
    _keyForm.currentState.save();
    if (model.selectedProductIndex == null) {
      model.addProduct(iProduct(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          imageUrl: _formData['imageUrl']));
      Navigator.pushReplacementNamed(context, '/products');
    } else {
      model.updateProduct(iProduct(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          imageUrl: _formData['imageUrl']));
      Navigator.pop(context);
    }
  }
}
