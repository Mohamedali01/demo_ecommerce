import 'package:demo_ecommerce/constants.dart';
import 'package:demo_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool obscure;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  CustomTextFormField(
      {required this.label,
      this.obscure = false,
      this.suffixIcon,
      this.textInputType = TextInputType.text,
      this.onSaved,
      this.validator});

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
          onSaved: onSaved,
          validator: validator,
          obscureText: obscure,
          cursorColor: Color(kTextColor),
          keyboardType: textInputType,
          decoration: InputDecoration(suffixIcon: suffixIcon),
        ),
      ],
    );
  }
}
