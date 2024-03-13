import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

class LineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String title;
  final int? maxLength;
  final Widget? right;
  final TextInputType? keyboardType;
  final bool obscureText;
  const LineTextField(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.title,
      this.right,
      this.keyboardType,
      this.obscureText = false,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Tcolor.secondaryText)),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLength: maxLength,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            counterText: "",
            border: InputBorder.none,
            hintText: placeholder,
            suffixIcon: right,
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1,
          color: Tcolor.secondaryText,
        )
      ],
    );
  }
}
