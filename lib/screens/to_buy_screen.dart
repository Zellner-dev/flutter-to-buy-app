import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_buy/components/wished_item_card.dart';
import 'package:to_buy/providers/wished_list.dart';

class ToBuyScreen extends StatelessWidget {
  const ToBuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishedList = Provider.of<WishedList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("To buy"),
      ),
      body: ListView.builder(
        itemCount: wishedList.items.length,
        itemBuilder: (context, index) {
          return WishedItemCard(item: wishedList.items[index]);
        },
      ),
    );
  }
}