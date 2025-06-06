import 'package:smartdinner/domain/model/menu_item.dart';

class OrderItem {
  final String id;
  final String name;
  final String image;
  final int unitPrice;
  int quantity;

  OrderItem({
    required this.id,
    required this.name,
    required this.image,
    required this.unitPrice,
    this.quantity = 1,
  });

  OrderItem copyWith({int? quantity}) {
    return OrderItem(
      id: id,
      name: name,
      image: image,
      unitPrice: unitPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  factory OrderItem.fromMenuItem(MenuItem item) {
    return OrderItem(
      id: item.id,
      name: item.name,
      image: item.imageUrl,
      unitPrice: item.price,
    );
  }
}
