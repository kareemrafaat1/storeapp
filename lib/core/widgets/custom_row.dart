// lib/core/widgets/custom_row.dart
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onPressed;
  final TextStyle style;

  const CustomRow({
    super.key,
    required this.text,
    required this.linkText,
    required this.onPressed,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: onPressed,
          child: Text(
            linkText,
            style: style,
          ),
        ),
      ],
    );
  }
}
