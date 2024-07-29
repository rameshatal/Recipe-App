import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color buttonColor;
  final Color textColor;
  String title;
  AppRoundedButton({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.textColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: buttonColor,
          // shape: BoxShape.circle
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w300, color: textColor),
          ),
        ),
      ),
    );
  }
}
