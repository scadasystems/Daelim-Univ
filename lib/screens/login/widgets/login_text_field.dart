// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  //
  final TextEditingController controller;
  final String labelText;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: const TextStyle(
        fontSize: 40,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
