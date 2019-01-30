import 'package:scoped_model/scoped_model.dart';
import '../models/product.model.dart';

class ProductScopedModel extends Model {
  List<iProduct> _products = [];
  int _selectProductIndex;
  // thanks to get keywork, products canbe accessed from outside by dot notation
  List<iProduct> get products {
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectProductIndex;
  }

  iProduct get selectedProduct {
    if (_selectProductIndex == null) {
      return null;
    }
    return products[selectedProductIndex];
  }

  void addProduct(iProduct product) {
    _products.add(product);
    _selectProductIndex = null;
  }

  void deleteProduct() {
    _products.removeAt(_selectProductIndex);
    _selectProductIndex = null;
  }

  void updateProduct(iProduct product) {
    _products[_selectProductIndex] = product;
    _selectProductIndex = null;
  }

  void selectProduct(int index) {
    _selectProductIndex = index;
  }
}

// contain all methods (functions) related to product which
// will be called outside
//
