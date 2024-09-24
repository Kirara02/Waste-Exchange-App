import 'package:flutter/material.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  const CustomButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 18),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: Typogaphy.Medium.copyWith(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
