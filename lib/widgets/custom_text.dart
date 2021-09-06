import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  final bool? deletedText;

  CustomText(this.text,
      {this.fontSize = 16,
        this.fontWeight = FontWeight.normal,
        this.color = Colors.black,
        this.overflow, this.deletedText = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: overflow,
      style:
      TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color,
          decoration: deletedText! ? TextDecoration.lineThrough:TextDecoration.none
      ),
    );
  }
}
