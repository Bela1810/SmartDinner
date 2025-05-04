import 'package:flutter/material.dart';
import 'package:smartdinner/ui/screens/admin_screens/admin_home_screen/admin_home_screen.dart';
import 'package:smartdinner/ui/widgets/new_account.dart';
import 'package:smartdinner/ui/widgets/email.dart';
import 'package:smartdinner/ui/widgets/login_button.dart';
import 'package:smartdinner/ui/widgets/password.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF073B4C),
      body: Padding(
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'INICIAR SESIÓN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Email(
                      controller: email,
                      hintText: 'Ingrese su correo...',
                      obscureText: false,
                    ),
                  ),
                  Password(
                    controller: password,
                    hintText: 'Ingrese contraseña...',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  LoginButton(
                    emailController: email,
                    passwordController: password,
                  ),
                  const SizedBox(height: 20),
                  NewAccount(),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AdminHome()),
                      );
                    },
                    icon: const Icon(Icons.admin_panel_settings),
                    label: const Text('Soy admin'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF073B4C),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
