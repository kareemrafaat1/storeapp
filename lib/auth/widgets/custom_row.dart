import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback? onPressed;
  final TextStyle? style;
  const CustomRow(
      {super.key,
      required this.text,
      required this.linkText,
      this.onPressed,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            linkText,
            style: style ??
                const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}