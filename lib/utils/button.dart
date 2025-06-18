import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsets padding;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderColor = Colors.blue,
    this.textColor = Colors.blue,
    this.borderWidth = 2,
    this.borderRadius = 32,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.baiJamjuree(
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
