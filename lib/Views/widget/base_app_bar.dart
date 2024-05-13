
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;
  final bool showBorderBottom;
  final Color? borderBottomColor;
  final double borderBottomWidth;
  final Widget? rightIconWidget; // Accepte un Widget pour l'icône de droite
  final Widget? leftIconWidget; // Accepte un Widget pour l'icône de gauche

  const BaseAppBar({
    Key? key,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackButtonPressed,
    this.showBorderBottom = false,
    this.borderBottomColor = Colors.grey,
    this.borderBottomWidth = 1.0,
    this.rightIconWidget, // Pour insérer un widget personnalisé à droite
    this.leftIconWidget, // Pour insérer un widget personnalisé à gauche
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> effectiveActions = actions ?? [];
    if (rightIconWidget != null) {
      effectiveActions.add(rightIconWidget!);
    }

    Widget? leadingWidget;
    if (leftIconWidget != null) {
      leadingWidget = leftIconWidget;
    } else if (showBackButton && Navigator.canPop(context)) {
      leadingWidget = IconButton(
        icon: Icon(Icons.arrow_back, color: foregroundColor),
        onPressed: onBackButtonPressed ?? () => Navigator.of(context).pop(),
      );
    }

    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      title: Text(title ?? '',
          style: TextStyle(color: foregroundColor, fontSize: 15)),
      centerTitle: true,
      elevation: 0,
      leading: leadingWidget,
      actions: effectiveActions,
      bottom: showBorderBottom
          ? PreferredSize(
        preferredSize: Size.fromHeight(borderBottomWidth),
        child: Container(
          color: borderBottomColor,
          height: borderBottomWidth,
        ),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (showBorderBottom ? borderBottomWidth : 0));
}
