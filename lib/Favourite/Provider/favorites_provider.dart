import 'package:ecommerce_store/utils/product_model.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<ProductModel> _favorites = [];

  List<ProductModel> get favorites => _favorites;

  void toggleFavorite(ProductModel product) {
    final existingIndex =
        _favorites.indexWhere((item) => item.name == product.name);
    if (existingIndex != -1) {
      _favorites.removeAt(existingIndex);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(String name) {
    return _favorites.any((item) => item.name == name);
  }
}
