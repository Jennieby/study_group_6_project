import 'package:flutter/widgets.dart';

class Item {
  final String itemName;
  final String itemDescription;
  final double itemPrice;
  final IconData itemIcon;

  Item({
    required this.itemName,
    required this.itemPrice,
    this.itemDescription = "",
    required this.itemIcon,
  });
}
