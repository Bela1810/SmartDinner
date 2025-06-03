import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu nombre';
    }

    return null;
  };
});

final emailValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu correo';
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailValid) {
      return 'Ingresa un correo valido';
    }

    return null;
  };
});

final passwordValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu contraseña';
    }

    if (value.length < 6) {
      return 'Tu contraseña debe tener al menos 6 caracteres';
    }

    return null;
  };
});
