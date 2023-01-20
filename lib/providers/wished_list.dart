import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_buy/model/wished_item.dart';

class WishedList with ChangeNotifier {
  final List<WishedItem> _items = [
    WishedItem(
      id: Random().nextDouble().toString(), 
      name: "Bolsa Dell", 
      avgValue: 200, 
      urlImage: "urlImage", 
      isBought: false
    )
  ];

  List<WishedItem> get items {
    return [..._items];
  }

  void removeItem(String id) {
    _items.remove(
      _items.firstWhere((item) => item.id == id)
    );
    notifyListeners();
  }
}