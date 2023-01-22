import 'package:flutter/cupertino.dart';

class WishedItem with ChangeNotifier{
  final String id;
  final String name;
  final double avgValue;
  final String url;
  bool isBought;

  WishedItem({
    required this.id,
    required this.name,
    required this.avgValue,
    required this.url,
    required this.isBought,
  });

  void toggleIsBought() {
    isBought = !isBought;
    notifyListeners();
  }
}