import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final int height;
  final TextStyle? textStyle;
  final Color? background;
  final Color? foreground;
  final bool loading;
  final double borderRadius;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final Color rightIconColor; // Ajoutez cette ligne
  final Color leftIconColor; // Ajoutez cette ligne

  BaseButton({
    required this.onPressed,
    this.text = 'Save',
    this.height = 60,
    this.textStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    this.background = Colors.redAccent,
    this.foreground = Colors.white,
    this.loading = false,
    this.borderRadius = 1,
    this.rightIcon,
    this.leftIcon,
    this.rightIconColor = Colors.white, // Ajoutez cette ligne
    this.leftIconColor = Colors.white, // Ajoutez cette ligne
  });

  @override
  _BaseButtonState createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height.toDouble(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
          widget.background ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        onPressed: widget.loading ? null : widget.onPressed,
        child: widget.loading
            ? const CircularProgressIndicator(color: Colors.white)
            : Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: widget.leftIcon != null
                    ? IconTheme(
                  data: IconThemeData(color: widget.leftIconColor),
                  child: widget.leftIcon!,
                )
                    : Container(),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.text,
                style: widget.textStyle,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: widget.rightIcon != null
                    ? IconTheme(
                  data: IconThemeData(color: widget.rightIconColor),
                  child: widget.rightIcon!,
                )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}