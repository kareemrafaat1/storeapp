import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddToCartButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: Color(0xFF53B175),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 14,
        ),
      ),
    );
  }
}
