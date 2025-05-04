import 'package:flutter/material.dart';
import 'package:smartdinner/model/menu_item.dart';
import 'package:smartdinner/ui/widgets/menu_card.dart';

class CategoryListWidget extends StatelessWidget {
  final List<String> categories;

  const CategoryListWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: categories.map((category) {
        final List<MenuItem> items = MenuItem.menuItems[category] ?? [];
        return CategoryTileWidget(category: category, items: items);
      }).toList(),
    );
  }
}

class CategoryTileWidget extends StatelessWidget {
  final String category;
  final List<MenuItem> items;

  const CategoryTileWidget({
    super.key,
    required this.category,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          category.toUpperCase(),
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF073B4C),
          ),
        ),
      ),
      children: items
          .map((item) => Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: MenuItemCardWidget(item: item),
              ))
          .toList(),
    );
  }
}