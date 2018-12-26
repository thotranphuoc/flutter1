import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue;
  String descValue;
  double priceValue;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Center(
    //     child: RaisedButton(
    //   child: Text('Save'),
    //   onPressed: () {
    //     showModalBottomSheet(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return Center(
    //             child: Text('This is a modal!'),
    //           );
    //         });
    //   },
    // ));

    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Product Title'),
            onChanged: (String value) {
              print(value);
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(labelText: 'Product Description'),
            onChanged: (String value) {
              print(value);
              setState(() {
                descValue = value;
              });
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Product Price'),
            onChanged: (String value) {
              print(value);
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
          // Text(textValue)
        ],
      ),
    );
  }
}
