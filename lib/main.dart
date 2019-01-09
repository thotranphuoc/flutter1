import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/auth.dart';
import './pages/product_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './models/product.model.dart';
import './scoped-models/product.scope.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // List<iProduct> _products = [];

  // void _addProduct(iProduct product) {
  //   setState(() {
  //     _products.add(product);
  //   });
  // }

  // void _deleteProduct(int index) {
  //   setState(() {
  //     _products.removeAt(index);
  //   });
  // }

  // void _updateProduct(int index, iProduct product) {
  //   setState(() {
  //     _products[index] = product;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ProductScopedModel(),
      child: MaterialApp(
        debugShowMaterialGrid: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple,
        ),
        // home: AuthPage(),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) => ProductsPage(),
          '/admin': (BuildContext context) => ProductAdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          print(pathElements);
          if (pathElements[0] != '') {
            return null;
          }

          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
                builder: (BuildContext context) => ProductPage(index));
          }

          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage());
        },
      ),
    );
  }
}
