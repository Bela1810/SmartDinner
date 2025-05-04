import 'package:flutter/material.dart';
import 'package:smartdinner/ui/widgets/repeat_password_text.dart';

class RepeatPassword extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const RepeatPassword(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RepeatPasswordText(),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 34, right: 34),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
