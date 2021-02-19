import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(this.id, this.title, this.quantity, this.price);
}

class Cart with ChangeNotifier{
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total +=  value.quantity * value.price;
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    if(_items.containsKey(productId)) {
      _items.update(productId, (existingItemInCart) => CartItem(productId, title, existingItemInCart.quantity+1 , price));
    }
    else {
      _items.putIfAbsent(productId, () => CartItem(productId, title, 1, price));
    }

    // не забываем про прослушку на изменение данных
    notifyListeners();
  }
}