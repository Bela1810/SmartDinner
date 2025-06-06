import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/domain/model/menu_item.dart';
import 'package:smartdinner/domain/repositories/menu_repository.dart';
import 'package:smartdinner/provider/menu_provider.dart';

final menuControllerProvider = StateNotifierProvider<MenuController,
    AsyncValue<Map<String, List<MenuItem>>>>(
  (ref) => MenuController(ref.read(menuRepositoryProvider)).._loadMenu(),
);

class MenuController
    extends StateNotifier<AsyncValue<Map<String, List<MenuItem>>>> {
  final MenuRepository _repository;

  MenuController(this._repository) : super(const AsyncLoading()) {
    _loadMenu();
  }

  Future<void> _loadMenu() async {
    try {
      final menu = await _repository.getFullMenu();
      state = AsyncData(menu);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
