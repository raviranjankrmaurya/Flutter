import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProducts(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProducts(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
