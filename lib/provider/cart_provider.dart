import 'package:flutter/material.dart';
import 'package:group_cart_project/model/items.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> _cartItems = [];
  
  List<Item> get cartItems => _cartItems;

  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + item.itemPrice);
  }

  void addItemToCart(Item item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItemFromCart(Item item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void resetCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
