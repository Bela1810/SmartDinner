import 'package:flutter/material.dart';
import 'package:smartdinner/ui/widgets/account.dart';
import 'package:smartdinner/ui/widgets/email.dart';
import 'package:smartdinner/ui/widgets/password.dart';
import 'package:smartdinner/ui/widgets/register_button.dart';
import 'package:smartdinner/ui/widgets/repeat_password.dart';
import 'package:smartdinner/ui/widgets/user_name.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF073B4C),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'REGISTRO',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  UserName(hintText: "Ingrese su Usuario", obscureText: false),
                  Email(
                    controller: email,
                    hintText: 'Ingrese su correo...',
                    obscureText: false,
                  ),
                  Password(
                    controller: password,
                    hintText: 'Ingrese su contraseña...',
                    obscureText: true,
                  ),
                  RepeatPassword(
                      controller: repeatPassword,
                      hintText: "Ingrese nuevamente la contraseña",
                      obscureText: true),
                  const SizedBox(height: 20),
                  RegisterButton(
                      emailController: email,
                      passwordController: password,
                      repeatPasswordController: repeatPassword),
                  Account(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
