import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/controller/login_state.dart';
import 'package:smartdinner/data/repository/auth_repository.dart';
import 'package:smartdinner/provider/repository_provider.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthController(repository);
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository repository;

  AuthController(this.repository) : super(const AsyncData(null));

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      await repository.login(email, password);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    try {
      await repository.logout();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
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
