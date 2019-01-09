import 'package:scoped_model/scoped_model.dart';
import '../models/product.model.dart';

class ProductScopedModel extends Model {
  List<iProduct> _products = [];

  // thanks to get keywork, products canbe accessed from outside
  List<iProduct> get products {
    return List.from(_products);
  }

  void addProduct(iProduct product) {
    _products.add(product);
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
  }

  void updateProduct(int index, iProduct product) {
    _products[index] = product;
  }
}

// contain all methods (functions) related to product which
// will be called outside
//
