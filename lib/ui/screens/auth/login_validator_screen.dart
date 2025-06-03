import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/provider/repository_provider.dart';
import 'package:smartdinner/ui/screens/auth/auth_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';

class LoginValidatorScreen extends ConsumerWidget {
  const LoginValidatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
        data: (user) {
          if (user != null) return const TableScreen();
          return const AuthScreen();
        },
        error: (_, trace) => const AuthScreen(),
        loading: () => Container());
  }
}
