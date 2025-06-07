import 'package:smartdinner/domain/model/user_model.dart';

abstract class AuthDatasource {
  Future<User> login(String email, String password);
  Future<void> register(String name, String email, String password);
  Future<void> logout();
}
