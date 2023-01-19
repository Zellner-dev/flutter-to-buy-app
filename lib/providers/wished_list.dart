import 'package:flutter/material.dart';
import 'package:to_buy/model/wished_item.dart';

class WishedList with ChangeNotifier {
  final List<WishedItem> _items = [
    WishedItem(
      id: "1", 
      name: "Bolsa Dell", 
      avgValue: 200, 
      urlImage: "urlImage", 
      isBought: false
    )
  ];

  List<WishedItem> get items {
    return [..._items];
  }
}