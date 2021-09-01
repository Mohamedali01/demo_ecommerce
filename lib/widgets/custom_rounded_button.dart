import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final Color color;

  CustomRoundedButton(
      {this.onPressed,
      required this.child,
      this.width,
      this.height,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
     borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: height,
        child: Material(
          color: color,
          child: TextButton(
            onPressed: onPressed,
            child: child,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
