import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_cart_project/data/item_list.dart';
import 'package:group_cart_project/item_widget.dart';
import 'package:group_cart_project/pages/cart_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog",
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(Icons.shopping_cart_outlined),
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
