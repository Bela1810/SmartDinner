import 'package:smartdinner/domain/datasource/auth_datasource.dart';
import 'package:smartdinner/domain/model/user_model.dart';

class AuthRepository {
  final AuthDatasource datasource;

  AuthRepository(this.datasource);

  Future<User> login(String email, String password) {
    return datasource.login(email, password);
  }

  Future<void> register(String email, String password, String name) {
    return datasource.register(name, email, password);
  }

  Future<void> logout() {
    return datasource.logout();
  }
}
