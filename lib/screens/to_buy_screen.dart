import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_buy/components/wished_item_card.dart';
import 'package:to_buy/components/wished_item_form.dart';
import 'package:to_buy/providers/wished_list.dart';

class ToBuyScreen extends StatelessWidget {
  const ToBuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final wishedList = Provider.of<WishedList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("To buy"),
        actions: [
          IconButton(
            onPressed: () async {
              await showDialog(
                context: context, 
                builder: (context) => const WishedItemForm(),
              );
            }, 
            icon: const Icon(
              Icons.add_rounded
            )
          )
        ],
      ),
      body: Consumer<WishedList>(
        builder: (context, wished, child) {
          return ListView.builder(
            itemCount: wishedList.toBuyList.length,
            itemBuilder: (context, index) {
              return WishedItemCard(item: wishedList.toBuyList[index]);
            },
          );
        }
      ),
    );
  }
}