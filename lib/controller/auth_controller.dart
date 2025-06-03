import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/controller/login_state.dart';
import 'package:smartdinner/domain/model/login_params.dart';
import 'package:smartdinner/domain/model/register_params.dart';
import 'package:smartdinner/provider/repository_provider.dart';

class LoginController extends StateNotifier<LoginState> {
  final Ref ref;

  LoginController(this.ref) : super(const LoginStateInitial());

  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await ref
          .read(authRepositoryProvider)
          .login(LoginParams(email: email, password: password));
      state = const LoginStateSuccess();
    } catch (exc) {
      state = LoginStateError(exc.toString());
    }
  }

  void logout() async {
    await ref.read(authRepositoryProvider).logout();
  }
}

class RegisterController extends StateNotifier<RegisterState> {
  final Ref ref;
  RegisterController(this.ref) : super(const RegisterStateInitial());

  void register(String name, String email, String password) async {
    state = const RegisterStateLoading();
    try {
      await ref.read(authRepositoryProvider).register(
          RegisterParams(name: name, email: email, password: password));
      state = const RegisterStateSuccess();
    } catch (exc) {
      state = RegisterStateError(exc.toString());
    }
  }
}
