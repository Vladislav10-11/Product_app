import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get itemCount => _cartItems.length;

  double get totalPrice {
    double total = 0.0;
    for (var cartItem in _cartItems) {
      total += cartItem.product.price * cartItem.quantity;
    }
    return total;
  }

  void addToCart(Product product) {
    for (var cartItem in _cartItems) {
      if (cartItem.product.id == product.id) {
        cartItem.quantity++;
        notifyListeners();
        return;
      }
    }
    _cartItems.add(CartItem(product: product, quantity: 1));
    notifyListeners();
  }

  void removeFromCart(Product product) {
    for (var cartItem in _cartItems) {
      if (cartItem.product.id == product.id) {
        if (cartItem.quantity > 1) {
          cartItem.quantity--;
        } else {
          _cartItems.remove(cartItem);
        }
        notifyListeners();
        return;
      }
    }
  }
}
