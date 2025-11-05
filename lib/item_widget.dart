import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_cart_project/model/items.dart';
import 'package:group_cart_project/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item, this.isItemInCart=false});
  final Item item;
  final bool isItemInCart;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    return ListTile(
      leading: CircleAvatar(child: Icon(item.itemIcon)),
      title: Text(
        item.itemName,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 17),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.itemDescription, style: GoogleFonts.poppins(fontSize: 14)),
          Text(
            "\$${item.itemPrice.toStringAsFixed(2)}",
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      trailing: isItemInCart
    ? ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          provider.removeItemFromCart(item);
        },
        child: Text("Remove", style: GoogleFonts.poppins(color: Colors.red),),
      )
    : ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          provider.addItemToCart(item);
        },
        child: Text("Add", style: GoogleFonts.poppins(),),
      ),

    );
  }
}
