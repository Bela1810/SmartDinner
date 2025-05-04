import 'package:flutter/material.dart';

class UserAccountForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController previousPasswordController;
  final TextEditingController newPasswordController;
  final VoidCallback onSave;

  const UserAccountForm({
    super.key,
    required this.usernameController,
    required this.previousPasswordController,
    required this.newPasswordController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: 'Nombre de Usuario',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 30),
        TextFormField(
          controller: previousPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña Anterior',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 30),
        TextFormField(
          controller: newPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Nueva Contraseña',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: onSave,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF073B4C),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text(
            'GUARDAR CAMBIOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
