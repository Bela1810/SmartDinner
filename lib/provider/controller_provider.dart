import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/controller/auth_controller.dart';
import 'package:smartdinner/controller/login_state.dart';
import 'package:smartdinner/data/repository/auth_repository.dart';
import 'package:smartdinner/provider/repository_provider.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<void>>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return LoginController(repository);
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
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
