import 'package:smartdinner/domain/model/order_item.dart';

class OrderState {
  final List<OrderItem> items;
  final String status;

  OrderState({
    this.items = const [],
    this.status = 'Disponible',
  });

  OrderState copyWith({
    List<OrderItem>? items,
    String? status,
  }) {
    return OrderState(
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }
}
