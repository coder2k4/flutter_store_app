import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/providers/orders.dart' as item;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final item.OrderItem order;

  const OrderItem({Key key, this.order}) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.order.amount.toStringAsFixed(2)),
            subtitle:
                Text(DateFormat('dd-MM-yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if(_expanded)
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              height: min(widget.order.products.length * 20.0 + 100, 90),
              child: ListView.builder(
              itemCount: widget.order.products.length,
              itemBuilder: (context, i) => Row(
                children: [
                  Text(widget.order.products[i].title),
                  SizedBox(width: 10,),
                  Text(widget.order.products[i].price.toStringAsFixed(2)),
                  SizedBox(width: 10,),
                  Text(widget.order.products[i].quantity.toString()),
                ],
              ))
            )
        ],
      ),
    );
  }
}
