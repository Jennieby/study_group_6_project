import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_cart_project/item_widget.dart';
import 'package:group_cart_project/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart(${cartProvider.cartItems.length})",
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return ItemWidget(item: item, isItemInCart: true);
              },
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              return cartProvider.resetCart();
            },
            label: Text(
              "BUY \$${cartProvider.totalPrice.toStringAsFixed(2)}",
              style: GoogleFonts.nunito(),
            ),
            icon: Icon(Icons.shopping_bag),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
