import 'package:flutter/material.dart';
import 'package:flutter_store_app/providers/products.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFaw;

  const ProductsGrid(this.showFaw);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFaw ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        //value: products[i],
        child: ProductItem(),
          // builder: (c) => products[i],
          // products[i].id,
          // products[i].title,
          // products[i].imageUrl,

      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
