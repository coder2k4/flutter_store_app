import 'package:flutter/material.dart';
import 'package:flutter_store_app/widgets/products_grid.dart';


enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('X-SIGHT SHOP'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only favorites'), value: FilterOptions.Favorite,),
              PopupMenuItem(child: Text('All'), value: FilterOptions.All,),
            ],
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue){
              print(selectedValue);
            },
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
