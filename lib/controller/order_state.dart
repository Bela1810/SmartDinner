import 'package:smartdinner/domain/model/order_item.dart';

class OrderState {
  final List<OrderItem> items;

  OrderState({this.items = const []});

  OrderState copyWith({List<OrderItem>? items}) {
    return OrderState(items: items ?? this.items);
  }
}
