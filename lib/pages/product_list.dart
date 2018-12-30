import 'package:flutter/material.dart';
import './product_edit.dart';
class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  ProductListPage(this.products);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            // leading: Image.asset(products[index]['imageUrl']),
            leading: CircleAvatar(
              backgroundImage: AssetImage(products[index]['imageUrl']),
            ),
            title: Text(products[index]['title']),
            trailing: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ProductEditPage(product: products[index],);
                    }
                  )
                );
              },
              icon: Icon(Icons.edit),
            ));
      },
      itemCount: products.length,
    );
  }
}
