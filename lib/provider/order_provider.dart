import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/controller/order_controller.dart';
import 'package:smartdinner/controller/order_state.dart';

final orderControllerProvider =
    StateNotifierProvider.family<OrderController, OrderState, String>(
  (ref, tableId) => OrderController(),
);
