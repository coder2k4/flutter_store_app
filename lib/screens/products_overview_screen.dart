import 'package:flutter/material.dart';
import 'package:flutter_store_app/providers/cart.dart';
import 'package:flutter_store_app/screens/cart_screen.dart';
import 'package:flutter_store_app/widgets/app_drawer.dart';
import 'package:flutter_store_app/widgets/badge.dart';
import 'package:flutter_store_app/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool favItem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('X-SIGHT SHOP'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) =>
            [
              PopupMenuItem(
                child: Text('Только избранные товары'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Весь каталог'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorite)
                setState(() {
                  favItem = true;
                });
              else
                setState(() {
                  favItem = false;
                });
            },
          ),
          Consumer<Cart>(builder: (_, cart, ch) =>
              Badge(
                child: ch,
                value: cart.itemCount.toString(),
              ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
            //todo вставить виджет для корзины. BADGE
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(favItem),
    );
  }
}
