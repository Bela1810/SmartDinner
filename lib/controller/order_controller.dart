import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/domain/model/order_item.dart';
import 'package:smartdinner/controller/order_state.dart';

class OrderController extends StateNotifier<OrderState> {
  OrderController() : super(OrderState());

  void add(OrderItem item) {
    final existing = state.items.where((i) => i.id == item.id).toList();

    if (existing.isNotEmpty) {
      final updated = state.items.map((i) {
        if (i.id == item.id) {
          return i.copyWith(quantity: i.quantity + item.quantity);
        }
        return i;
      }).toList();

      state = state.copyWith(items: updated);
    } else {
      state = state.copyWith(items: [...state.items, item]);
    }
  }

  void increase(OrderItem item) {
    final updated = state.items.map((i) {
      if (i.id == item.id) {
        return i.copyWith(quantity: i.quantity + 1);
      }
      return i;
    }).toList();

    state = state.copyWith(items: updated);
  }

  void decrease(OrderItem item) {
    final updated = state.items.map((i) {
      if (i.id == item.id && i.quantity > 1) {
        return i.copyWith(quantity: i.quantity - 1);
      }
      return i;
    }).toList();

    state = state.copyWith(items: updated);
  }

  void remove(OrderItem item) {
    final updated = state.items.where((i) => i.id != item.id).toList();
    state = state.copyWith(items: updated);
  }

  void clear() {
    state = OrderState(items: []);
  }

  void removeById(String itemId) {
    state = OrderState(
      items: state.items.where((item) => item.id != itemId).toList(),
    );
  }

  void sendOrder() {
    state = state.copyWith(status: 'Ordenada');
  }
}
