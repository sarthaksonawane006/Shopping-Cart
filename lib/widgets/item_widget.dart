import 'package:flutter/material.dart';
import 'package:shopping_cart/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}", 
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 20),),
      ),
    );
  }
}
