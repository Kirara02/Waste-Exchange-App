import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: AppColors.secondaryExtraSoft),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: Typogaphy.Regular,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: Typogaphy.Regular.copyWith(
            color: AppColors.secondarySoft,
            fontSize: 14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: Typogaphy.Medium.copyWith(
            fontSize: 14,
            color: AppColors.secondarySoft,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: SvgPicture.asset(
                    _obscureText ? 'assets/icons/hide.svg' : 'assets/icons/show.svg',
                  ),
                  onPressed: _toggleObscureText,
                )
              : widget.suffixIcon,
        ),
      ),
    );
  }
}
