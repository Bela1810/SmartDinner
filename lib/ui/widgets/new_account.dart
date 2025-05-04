import 'package:flutter/material.dart';
import 'package:smartdinner/ui/screens/register/register_screen.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
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
