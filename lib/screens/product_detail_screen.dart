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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox( 
              height: 10,
            ),
            Text(
              loadedProduct.price.toStringAsFixed(2),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
