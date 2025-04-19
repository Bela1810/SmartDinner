import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF073B4C),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   '/assets/images/dark.png',
            //   width: 10,
            //   height: 10,
            //   fit: BoxFit.fill,
            // ),
          ],
        ),
      )),
    );
  }
}
