import 'package:flutter/material.dart';
import 'package:flutter_store_app/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('X-SIGHT SHOP'),
      ),
      body: ProductsGrid(),
    );
  }
}
