import 'package:flutter/material.dart';

import '../model/all_categories_model.dart';

class Cart extends ChangeNotifier {
  List<Product> _items = [];

  void add(Product item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Product item) {
    _items.remove(item);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }


  List<Product> get basketItems {
    return _items;
  }

  clear() {
    _items.clear();
  }
}
