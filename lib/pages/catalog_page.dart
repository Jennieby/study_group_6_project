import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_cart_project/data/item_list.dart';
import 'package:group_cart_project/item_widget.dart';
import 'package:group_cart_project/pages/cart_page.dart';
import 'package:group_cart_project/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog",
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          // // Using stack to make the cart item counter on the shopping cart icon
          // Stack(
          //   clipBehavior: Clip.hardEdge,
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         Navigator.of(
          //           context,
          //         ).push(MaterialPageRoute(builder: (context) => CartPage()));
          //       },
          //       icon: cartProvider.cartItems.isEmpty
          //           ? Icon(Icons.shopping_cart_outlined)
          //           : Icon(Icons.shopping_cart),
          //     ),
          //     if (cartProvider.cartItems.isNotEmpty)
          //       Positioned(
          //         right: 1,
          //         top: 1,
          //         child: Container(
          //           height: 20,
          //           width: 20,
          //           decoration: BoxDecoration(
          //             color: Colors.red.shade800,
          //             shape: BoxShape.circle,
          //           ),
          //           child: Text(
          //             "${cartProvider.cartItems.length}",
          //             style: TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.bold,
          //             ),
          //             textAlign: TextAlign.center,
          //           ),
          //         ),
          //       ),
          //   ],
          // ),
          // using badge to make the cart itrms counter on the shopping cart icon
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              isLabelVisible: cartProvider.cartItems.isEmpty ? false : true,
              backgroundColor: Colors.yellow.shade900,
              label: Text(
                "${cartProvider.cartItems.length}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => CartPage()));
                },

                icon: cartProvider.cartItems.isEmpty
                    ? Icon(Icons.shopping_cart_outlined)
                    : Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Items.length,
        itemBuilder: (context, index) => ItemWidget(item: Items[index]),
      ),
    );
  }
}
