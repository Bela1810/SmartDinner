import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/domain/model/menu_item.dart';
import 'package:smartdinner/domain/model/order_item.dart';
import 'package:smartdinner/provider/order_provider.dart';
import 'package:smartdinner/ui/widgets/product_detail.dart';
import 'package:smartdinner/ui/widgets/product_image.dart';
import 'package:smartdinner/ui/widgets/selection_button.dart';

class MenuItemCardWidget extends ConsumerWidget {
  final MenuItem item;
  final String tableId;

  const MenuItemCardWidget({
    super.key,
    required this.item,
    required this.tableId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderControllerProvider(tableId));
    final isSelected = state.items.any((orderItem) => orderItem.id == item.id);
    final controller = ref.read(orderControllerProvider(tableId).notifier);

    void toggleSelection() {
      if (isSelected) {
        controller.removeById(item.id);
      } else {
        controller.add(OrderItem.fromMenuItem(item));
      }
    }

    return Container(
      height: 115,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: Card(
        color: const Color.fromRGBO(237, 251, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFF073B4C), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            children: [
              ProductImage(url: item.imageUrl),
              const SizedBox(width: 12),
              Expanded(
                child: ProductDetails(
                  nombre: item.name,
                  precio: item.price.toString(),
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
