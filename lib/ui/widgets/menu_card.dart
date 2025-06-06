import 'package:flutter/material.dart';
import 'package:smartdinner/domain/model/menu_item.dart';
import 'package:smartdinner/ui/widgets/product_detail.dart';
import 'package:smartdinner/ui/widgets/product_image.dart';
import 'package:smartdinner/ui/widgets/selection_button.dart';

class MenuItemCardWidget extends StatefulWidget {
  final MenuItem item;

  const MenuItemCardWidget({super.key, required this.item});

  @override
  State<MenuItemCardWidget> createState() => _MenuItemCardWidgetState();
}

class _MenuItemCardWidgetState extends State<MenuItemCardWidget> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: Card(
        color: Color.fromRGBO(237, 251, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFF073B4C), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            children: [
              ProductImage(url: widget.item.imageUrl),
              const SizedBox(width: 12),
              Expanded(
                child: ProductDetails(
                  nombre: widget.item.name,
                  precio: widget.item.price.toString(),
                ),
              ),
              SelectionButton(
                isSelected: isSelected,
                onTap: toggleSelection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
