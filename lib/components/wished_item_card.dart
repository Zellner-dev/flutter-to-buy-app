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
        print("hello world");
      },
      key: Key(""),
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