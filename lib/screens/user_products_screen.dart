import 'package:flutter/material.dart';
import 'package:flutter_store_app/providers/products.dart';
import 'package:flutter_store_app/screens/edit_product_screen.dart';
import 'package:flutter_store_app/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (context, i) => Column(children: [
            UserProductItem(
              title: productData.items[i].title,
              imageUrl: productData.items[i].imageUrl,
            ),
            Divider(),
          ]),
          itemCount: productData.items.length,
        ),
      ),
    );
  }
}
