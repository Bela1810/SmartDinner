import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<User?> login(String email, String password);
  Future<void> register(String name, String email, String password);
  Future<void> logout();
}
