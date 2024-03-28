// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppIconTextButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Function()? onPressed;

  const AppIconTextButton({
    super.key,
    this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 18),
          Text(
            text,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
