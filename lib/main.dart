import 'package:flutter/material.dart';
import 'package:group_cart_project/pages/catalog_page.dart';
import 'package:group_cart_project/provider/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping app',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.teal[600],
            foregroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        debugShowCheckedModeBanner: false,
        home: CatalogPage(),
      ),
    );
  }
}
