import 'package:flutter/material.dart';
import 'package:flutter_store_app/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!

    print(productId);

    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    // Получаем из аргументов данные

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Container(
        child: Text('text'),
      ),
    );
  }
}
