import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartdinner/ui/screens/auth/login_validator_screen.dart';
import 'package:smartdinner/ui/screens/register/register_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';

final GoRouter router = GoRouter(initialLocation: '/auth', routes: [
  GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const TableScreen();
      }),
  GoRoute(
      path: '/auth', builder: (context, state) => const LoginValidatorScreen()),
  GoRoute(
      path: '/register',
      name: 'register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      })
]);
