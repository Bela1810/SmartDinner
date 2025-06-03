import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartdinner/domain/datasource/auth_datasource.dart';

class FirebaseServiceDatasource extends AuthDatasource {
  final FirebaseAuth _auth;

  FirebaseServiceDatasource(this._auth);

  @override
  Future<User?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        throw Exception('Usuario no encontrado');
      } else if (exception.code == 'wrong-password') {
        throw Exception('Contraseña incorrecta');
      } else {
        throw Exception('Error de autenticación: ${exception.message}');
      }
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Para agregar el nombre
    await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
