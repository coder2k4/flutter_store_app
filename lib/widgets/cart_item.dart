import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final String title;
  final int quantity;

  const CartItem(
      {this.id = '1',
      this.price = 100,
      this.title = 'test',
      this.quantity = 1});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  price.toString(),
                ),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text("${(price * quantity).toStringAsFixed(2)}"),
          trailing: Text(quantity.toString()),
        ),
      ),
    );
  }
}
