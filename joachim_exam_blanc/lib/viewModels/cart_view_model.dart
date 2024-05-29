import 'package:flutter/cupertino.dart';

import '../models/dish.dart';

class CartViewModel extends ChangeNotifier {
  Map<Dish, int> _cart = {};
  int _nbArticles = 0;
  double _totalPrice = 0;

  Map<Dish, int> get cart => _cart;
  int get nbArticles => _nbArticles;
  double get totalPrice => _totalPrice;

  void addToCart(Dish dish) {
    if (!_cart.containsKey(dish)) {
      _cart[dish] = 1;
    } else {
      _cart[dish] = _cart[dish]! + 1;
    }
    _nbArticles++;
    _totalPrice += dish.price;
    notifyListeners();
  }

  void incrementQuantity(Dish dish) {
    if (_cart.containsKey(dish)) {
      _cart[dish] = _cart[dish]! + 1;
      _nbArticles++;
      _totalPrice += dish.price;
      notifyListeners();
    }
  }

  void decrementQuantity(Dish dish) {
    if (_cart.containsKey(dish)) {
      _cart[dish] = _cart[dish]! - 1;
      if (_cart[dish] == 0) {
        _cart.remove(dish);
      }
      _nbArticles--;
      _totalPrice -= dish.price;
      notifyListeners();
    }
  }
}
