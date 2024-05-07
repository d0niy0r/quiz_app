import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final double borderRadius;
  final Color backColor;
  final Color textColor;
  final double textSize;
  final Function onTap;

  CustomButton({
    super.key,
    required this.title,
    required this.backColor,
    required this.textColor,
    required this.height,
    required this.width,
    required this.onTap,
    required this.borderRadius,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(); // Call onTap function when the button is tapped
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        height: height,
        width: width,
        child: Text(
          title,
          style: TextStyle(color: textColor, fontSize: textSize),
        ),
      ),
    );
  }
}
