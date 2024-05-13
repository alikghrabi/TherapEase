import 'package:flutter/material.dart';
import './password_strength_indicator.dart';

class BaseInput extends StatefulWidget {
  final String labelText;
  final bool floatingLabel;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool iconAtStart;
  final Widget? prefixIcon;
  final int maxLength;
  final int maxLine;
  final bool showMaxLengthIndicator;
  final bool showPasswordStrength;
  final bool isPassword;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double borderRadious;

  BaseInput({
    required this.labelText,
    this.floatingLabel = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChanged,
    this.iconAtStart = false,
    this.maxLength = 255,
    this.maxLine = 1,
    this.showMaxLengthIndicator = false,
    this.showPasswordStrength = false,
    this.prefixIcon,
    this.isPassword = false,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadious = 2,
  });

  @override
  _BaseInputState createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(widget.borderRadious)), // Utilisation de widget.borderRadious ici
          child: TextField(
            decoration: InputDecoration(
              floatingLabelBehavior: widget.floatingLabel
                  ? FloatingLabelBehavior.auto
                  : FloatingLabelBehavior.never,
              labelText: widget.labelText,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadious), // Utilisation de widget.borderRadious ici
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 1.2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadious), // Utilisation de widget.borderRadious ici
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 1.2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadious), // Utilisation de widget.borderRadious ici
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 1.2),
              ),
              prefixIcon: widget.iconAtStart ? widget.prefixIcon : null,
              suffixIcon: widget.iconAtStart ? null : widget.prefixIcon,
              counterText: widget.showMaxLengthIndicator ? null : '',
              fillColor: widget.backgroundColor,
              filled: widget.backgroundColor != null,
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            onChanged: widget.onChanged,
            maxLength: widget.showMaxLengthIndicator ? widget.maxLength : null,
            maxLines: widget.maxLine,
            obscureText: widget.isPassword,
            style: TextStyle(
              color: widget.foregroundColor,
            ),
          ),
        ),
        if (widget.isPassword)
          const SizedBox(
            height: 10,
          ),
        if (widget.isPassword && widget.showPasswordStrength)
          PasswordStrengthIndicator(password: widget.controller?.text ?? ''),
      ],
    );
  }
}