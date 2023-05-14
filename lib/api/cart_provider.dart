import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get itemCount => _cartItems.length;

  double get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  void addToCart(Product product) {
    CartItem cartItem = _cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product),
    );
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
    product.isInCart = true;
    notifyListeners();
  }

  void removeFromCart(Product product) {
    CartItem? cartItem = _cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product),
    );
    if (cartItem != null) {
      cartItem.quantity--;
      if (cartItem.quantity == 0) {
        _cartItems.remove(cartItem);
      }
    }
    product.isInCart = false;
    notifyListeners();
  }
}
