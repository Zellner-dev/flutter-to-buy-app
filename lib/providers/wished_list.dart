import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_buy/model/wished_item.dart';

class WishedList with ChangeNotifier {
  final List<WishedItem> _items = [
    WishedItem(
      id: Random().nextDouble().toString(), 
      name: "Bolsa Dell", 
      avgValue: 200, 
      url: "urlImage", 
      isBought: false
    )
  ];

  List<WishedItem> get items {
    return [..._items];
  }

  List<WishedItem> get toBuyList {
    final list = _items.where((item) => item.isBought == false).toList();
    return list;
  }

  List<WishedItem> get boughtList {
    final list = _items.where((item) => item.isBought == true).toList();
    return list;
  }

  void removeItem(String id) {
    _items.remove(
      _items.firstWhere((item) => item.id == id)
    );
    notifyListeners();
  }

  void addItem(WishedItem wishedItem){
    _items.add(wishedItem);
    notifyListeners();
  }
}