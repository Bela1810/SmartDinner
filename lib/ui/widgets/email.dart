import 'package:flutter/material.dart';
import 'package:smartdinner/ui/widgets/email_text.dart';

class Email extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const Email(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obscureText, required String? Function(String? p1) validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailText(),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 34, right: 34, bottom: 10),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
