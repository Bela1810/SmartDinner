import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartdinner/controller/login_state.dart';
import 'package:smartdinner/data/repository/auth_repository.dart';
import 'package:smartdinner/provider/session_provider.dart';

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository repository;
  final Ref ref;

  AuthController(this.repository, this.ref) : super(const AsyncData(null));

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final user = await repository.login(email, password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_logged_in', true);
      await prefs.setString('user_data', jsonEncode(user.toJson()));
      ref.invalidate(sessionProvider);

      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    try {
      await repository.logout();

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('is_logged_in');
      await prefs.remove('user_data');
      ref.invalidate(sessionProvider);

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

class RegisterController extends StateNotifier<RegisterState> {
  final AuthRepository repository;

  RegisterController(this.repository) : super(const RegisterStateInitial());

  Future<void> register(String name, String email, String password) async {
    state = const RegisterStateLoading();
    try {
      await repository.register(email, password, name);
      state = const RegisterStateSuccess();
    } catch (e) {
      state = RegisterStateError(e.toString());
    }
  }
}
