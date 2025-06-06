import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/data/datasource/menu_remote_datasource.dart';
import 'package:smartdinner/data/repository/menu_repository_impl.dart';
import 'package:smartdinner/domain/model/menu_item.dart';

final menuRepositoryProvider = Provider((ref) {
  return MenuRepositoryImpl(MenuRemoteDataSource());
});

final menuItemsProvider =
    FutureProvider.family<List<MenuItem>, String>((ref, category) {
  final repository = ref.watch(menuRepositoryProvider);
  return repository.getMenuByCategory(category);
});
