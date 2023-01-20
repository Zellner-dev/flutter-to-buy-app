import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_buy/model/wished_item.dart';

class WishedItemCard extends StatelessWidget {

  const WishedItemCard({
    super.key, 
    required this.item
  });
  
  final WishedItem item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (dissmis) {
        // Provider.of<WishedList>(context, listen: false).removeItem(item.id);
      },
      direction: DismissDirection.endToStart,
      key: Key(Random().nextDouble().toString()),
      child: Card(
        child: ListTile(
          title: Text(item.name),
          subtitle: Text(item.name),
          trailing: Text(item.avgValue.toStringAsFixed(2)),
          leading: const CircleAvatar(
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}