import 'package:smartdinner/data/datasource/menu_remote_datasource.dart';
import 'package:smartdinner/domain/model/menu_item.dart';
import 'package:smartdinner/domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDataSource remoteDataSource;

  MenuRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MenuItem>> getMenuByCategory(String category) {
    return remoteDataSource.fetchMenuByCategory(category);
  }

  @override
  Future<Map<String, List<MenuItem>>> getFullMenu() async {
    final categories = ['Entradas', 'Platos', 'Bebidas', 'Postres'];
    final Map<String, List<MenuItem>> fullMenu = {};

    for (final category in categories) {
      final items = await getMenuByCategory(category);
      fullMenu[category] = items;
    }

    return fullMenu;
  }
}
