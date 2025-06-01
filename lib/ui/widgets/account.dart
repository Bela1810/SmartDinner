import 'package:flutter/material.dart';
import 'package:smartdinner/ui/screens/auth/auth_screen.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AuthScreen()));
          },
          child: Text(
            "¿No te encuentras registrado?",
            style: TextStyle(
              color: Color(0xFF136EE5),
            ),
          ),
        )
      ],
    );
  }
}
