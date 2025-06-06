import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartdinner/controller/login_state.dart';
import 'package:smartdinner/provider/auth_validator_provider.dart';
import 'package:smartdinner/provider/controller_provider.dart';
import 'package:smartdinner/ui/widgets/account.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  bool _isPasswordVisibleP = false;
  bool _isPasswordVisibleC = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<RegisterState>(registerControllerProvider, (prev, next) {
      if (next is RegisterStateSuccess) {
        context.go('/home');
      }
      if (next is RegisterStateError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage)),
        );
      }
    });
    final nameValidator = ref.read(nameValidatorProvider);
    final emailValidator = ref.read(emailValidatorProvider);
    final passwordValidator = ref.read(passwordValidatorProvider);
    return Scaffold(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Center(
                              child: Text(
                                'REGISTRO',
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
                                const Text(
                                  'Nombre',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _nameController,
                                  textInputAction: TextInputAction.next,
                                  style: const TextStyle(color: Colors.white),
                                  validator: nameValidator,
                                  decoration: const InputDecoration(
                                    hintText: 'Ingrese su nombre...',
                                    prefixIcon: Icon(Icons.people),
                                    hintStyle: TextStyle(color: Colors.white70),
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
                                const SizedBox(height: 10),
                                const Text(
                                  'Correo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _emailController,
                                  textInputAction: TextInputAction.next,
                                  style: const TextStyle(color: Colors.white),
                                  validator: emailValidator,
                                  decoration: const InputDecoration(
                                    hintText: 'Ingrese su correo...',
                                    prefixIcon: Icon(Icons.email_outlined),
                                    hintStyle: TextStyle(color: Colors.white70),
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
                                const SizedBox(height: 10),
                                const Text(
                                  'Contraseña',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _passwordController,
                                  style: const TextStyle(color: Colors.white),
                                  validator: passwordValidator,
                                  obscureText: !_isPasswordVisibleP,
                                  decoration: InputDecoration(
                                    hintText: 'Ingrese contraseña...',
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    hintStyle:
                                        const TextStyle(color: Colors.white70),
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
                                        _isPasswordVisibleP
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Colors.white70,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisibleP =
                                              !_isPasswordVisibleP;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Confirmar Contraseña',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  style: const TextStyle(color: Colors.white),
                                  validator: passwordValidator,
                                  obscureText: !_isPasswordVisibleC,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Ingrese nuevamente la contraseña...',
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    hintStyle:
                                        const TextStyle(color: Colors.white70),
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
                                        _isPasswordVisibleC
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Colors.white70,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisibleC =
                                              !_isPasswordVisibleC;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        ref
                                            .read(registerControllerProvider
                                                .notifier)
                                            .register(
                                                _nameController.text,
                                                _emailController.text,
                                                _passwordController.text);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      backgroundColor: Color(0xFF118AB2),
                                      foregroundColor: Colors.black,
                                    ),
                                    child: const Text(
                                      'Registro',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(child: const Account()),
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
    );
  }
}
