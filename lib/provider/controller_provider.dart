import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartdinner/controller/auth_controller.dart';
import 'package:smartdinner/controller/login_state.dart';
import 'package:smartdinner/data/repository/auth_repository.dart';
import 'package:smartdinner/provider/repository_provider.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthController(repository);
});

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return RegisterController(repository);
});

class LoginController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository repository;

  LoginController(this.repository) : super(const AsyncData(null));

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      await repository.login(email, password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_logged_in', true);

      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_logged_in') ?? false;
  }
}
