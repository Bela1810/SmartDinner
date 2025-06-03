import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/provider/repository_provider.dart'; 
import 'package:smartdinner/ui/screens/register/register_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';

class RegisterValidatorScreen extends ConsumerWidget {
  const RegisterValidatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user != null) return const TableScreen();
        return const RegisterScreen();
      },
      error: (_, __) => const RegisterScreen(),
      loading: () => Container(),
    );
  }
}
