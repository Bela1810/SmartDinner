import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartdinner/provider/auth_validator_provider.dart';
import 'package:smartdinner/provider/controller_provider.dart';
import 'package:smartdinner/ui/widgets/new_account.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailValidator = ref.read(emailValidatorProvider);
    final passwordValidator = ref.read(passwordValidatorProvider);
    final loginState = ref.watch(authControllerProvider);

    ref.listen<AsyncValue<void>>(authControllerProvider,
        (previous, next) async {
      if (next is AsyncData<void>) {
        final isLoggedIn =
            await ref.read(authControllerProvider.notifier).isUserLoggedIn();
        if (isLoggedIn) {
          context.go('/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error al guardar el usuario.')),
          );
        }
      }

      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error.toString())),
        );
      }
    });

    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFF073B4C),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Image.asset(
                              './assets/images/dark.png',
                              width: 320,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 30.0),
                                  child: Text(
                                    'INICIAR SESIÓN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Correo',
                                        style: TextStyle(color: Colors.white)),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      controller: _emailController,
                                      textInputAction: TextInputAction.next,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      validator: emailValidator,
                                      decoration: const InputDecoration(
                                        hintText: 'Ingrese su correo...',
                                        prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                                        hintStyle:
                                            TextStyle(color: Colors.white70),
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white70),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text('Contraseña',
                                        style: TextStyle(color: Colors.white)),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      controller: _passwordController,
                                      obscureText: !_isPasswordVisible,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      validator: passwordValidator,
                                      decoration: InputDecoration(
                                        hintText: 'Ingrese contraseña...',
                                        prefixIcon:
                                            const Icon(Icons.lock_outline,color: Colors.white),
                                        hintStyle: const TextStyle(
                                            color: Colors.white70),
                                        border: const OutlineInputBorder(),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white70),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isPasswordVisible
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Colors.white70,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isPasswordVisible =
                                                  !_isPasswordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            ref
                                                .read(authControllerProvider
                                                    .notifier)
                                                .login(_emailController.text,
                                                    _passwordController.text);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          backgroundColor:
                                              const Color(0xFF118AB2),
                                          foregroundColor: Colors.black,
                                        ),
                                        child: const Text('Iniciar Sesión',
                                            style: TextStyle(fontSize: 16,color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Center(child: NewAccount()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        if (loginState is AsyncLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
