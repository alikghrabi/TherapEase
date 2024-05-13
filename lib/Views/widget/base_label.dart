import 'dart:ui';
import 'package:flutter/cupertino.dart';

class BaseLabel extends StatelessWidget {
  // final Color? color;
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final letterSpacing;
  final TextAlign? textAlign;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  BaseLabel({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.letterSpacing = 0.5,
    // this.color = Colors.redAccent,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          text ?? '',
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            // color: color,
          ),
          textAlign: textAlign,
        ),
      ],
    );
  }
}