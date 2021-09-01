import 'package:demo_ecommerce/constants.dart';
import 'package:demo_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool obscure;
  final Widget? suffixIcon;

  CustomTextFormField(
      {required this.label, this.obscure = false, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          label,
          color: Color(kTextColor),
        ),
        TextFormField(
          scrollPadding: EdgeInsets.zero,
          obscureText: obscure,
          cursorColor: Color(kTextColor),
          decoration: InputDecoration(suffixIcon: suffixIcon),
        ),
      ],
    );
  }
}
