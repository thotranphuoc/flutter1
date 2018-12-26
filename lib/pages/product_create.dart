import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String textFieldValue = '';
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

    return Column(
      children: <Widget>[
        TextField(
          onChanged: (String value) {
            print(value);
            setState(() {
              textFieldValue = value;
            });
          },
        ),
        Text(textFieldValue)
      ],
    );
  }
}
