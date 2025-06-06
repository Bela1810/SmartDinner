import 'package:smartdinner/domain/datasource/auth_datasource.dart';

class AuthRepository {
  final AuthDatasource datasource;

  AuthRepository(this.datasource);

  Future<void> login(String email, String password) {
    return datasource.login(email, password);
  }

  Future<void> register(String email, String password, String name) {
    return datasource.register(name, email, password);
  }
}
