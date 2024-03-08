import 'package:car_pooling/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Text text;
  final Function()? onTap;
  final double height;
  final double width;
  const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      required this.height,
      required this.width});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print("0k");
        }
      },
      child: Container(
          alignment: Alignment.center,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(16)),
          child: widget.text),
    );
  }
}
