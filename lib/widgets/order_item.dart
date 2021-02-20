import 'package:flutter/material.dart';
import 'package:flutter_store_app/providers/orders.dart' as item;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final item.OrderItem order;

  const OrderItem({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(order.amount.toStringAsFixed(2)),
            subtitle:
                Text(DateFormat('dd MM yyyy hh:mm').format(order.dateTime)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
