import 'package:flutter/material.dart';
import 'package:flutter_store_app/providers/orders.dart' show Orders;
import 'package:flutter_store_app/widgets/app_drawer.dart';
import 'package:flutter_store_app/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {

  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('X-Заказы'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, i) => OrderItem(
                order: orderData.orders[i],
              )),
    );
  }
}
