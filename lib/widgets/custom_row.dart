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
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            linkText,
            style: style,
          ),
        ),
      ],
    );
  }
}
