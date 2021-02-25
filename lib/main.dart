import 'package:flutter/material.dart';
import 'package:flutter_store_app/Utils/MaterialColors.dart';
import 'package:flutter_store_app/providers/cart.dart';
import 'package:flutter_store_app/providers/orders.dart';
import 'package:flutter_store_app/providers/products.dart';
import 'package:flutter_store_app/screens/cart_screen.dart';
import 'package:flutter_store_app/screens/orders_screen.dart';
import 'package:flutter_store_app/screens/product_detail_screen.dart';
import 'package:flutter_store_app/screens/products_overview_screen.dart';
import 'package:flutter_store_app/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor themeColor =
      generateMaterialColor(Color.fromRGBO(60, 60, 60, 1.0));

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Store App',
        theme: ThemeData(
          primarySwatch: themeColor,
          accentColor: Colors.redAccent,
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline6: TextStyle (
              color: Colors.white
            )
          )
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          UserProductsScreen.routeName: (context) => UserProductsScreen(),
        },
      ),
    );
  }
}
