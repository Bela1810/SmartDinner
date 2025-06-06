import 'package:flutter/material.dart';
import 'package:smartdinner/domain/model/menu_item.dart';
import 'package:smartdinner/ui/widgets/menu_card.dart';

class CategoryListWidget extends StatelessWidget {
  final Map<String, List<MenuItem>> menuItems;
  final String tableId;

  const CategoryListWidget({
    super.key,
    required this.menuItems,
    required this.tableId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: menuItems.entries.map((entry) {
        final category = entry.key;
        final items = entry.value;
        return CategoryTileWidget(
          category: category,
          items: items,
          tableId: tableId,
        );
      }).toList(),
    );
  }
}

class CategoryTileWidget extends StatelessWidget {
  final String category;
  final List<MenuItem> items;
  final String tableId;

  const CategoryTileWidget(
      {super.key,
      required this.category,
      required this.items,
      required this.tableId});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Container(
        padding: const EdgeInsets.all(10),
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
          .take(10)
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: MenuItemCardWidget(
                  item: item,
                  tableId: tableId,
                ),
              ))
          .toList(),
    );
  }
}
