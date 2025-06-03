import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess();
}

class LoginStateError extends LoginState {
  final String errorMessage;
  const LoginStateError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object?> get props => [];
}

class RegisterStateInitial extends RegisterState {
  const RegisterStateInitial();
}

class RegisterStateLoading extends RegisterState {
  const RegisterStateLoading();
}

class RegisterStateSuccess extends RegisterState {
  const RegisterStateSuccess();
}

class RegisterStateError extends RegisterState {
  final String errorMessage;
  const RegisterStateError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
