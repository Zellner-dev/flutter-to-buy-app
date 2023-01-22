import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_buy/components/wished_item_card.dart';
import 'package:to_buy/providers/wished_list.dart';

class BoughtPage extends StatelessWidget {
  const BoughtPage({super.key});

  @override
  Widget build(BuildContext context) {

    final bougthList = Provider.of<WishedList>(context).boughtList;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bought"),
      ),
      body: ListView.builder(
        itemCount: bougthList.length,
        itemBuilder: (context, index) {
          return WishedItemCard(item: bougthList[index]);
        },
      ),
    );
  }
}