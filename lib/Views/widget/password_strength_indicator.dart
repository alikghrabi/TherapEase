
import 'package:flutter/material.dart';

enum PasswordStrength {
  weak,
  medium,
  strong,
}

class PasswordStrengthIndicator extends StatefulWidget {
  final String password;

  PasswordStrengthIndicator({required this.password});

  @override
  _PasswordStrengthIndicatorState createState() =>
      _PasswordStrengthIndicatorState();
}

class _PasswordStrengthIndicatorState extends State<PasswordStrengthIndicator> {
  PasswordStrength strength = PasswordStrength.weak;

  @override
  void initState() {
    super.initState();
    _updatePasswordStrength();
  }

  void _updatePasswordStrength() {
    setState(() {
      strength = _calculatePasswordStrength(widget.password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: _buildStrengthBar(strength == PasswordStrength.strong)),
        Expanded(child: _buildStrengthBar(strength == PasswordStrength.medium)),
        Expanded(child: _buildStrengthBar(strength == PasswordStrength.weak)),
      ],
    );
  }

  Widget _buildStrengthBar(bool isActive) {
    final color = isActive
        ? Colors.green
        : widget.password.isEmpty
        ? Colors.grey[300] // Couleur par défaut si le mot de passe est vide
        : Colors
        .grey; // Couleur par défaut si le mot de passe n'est pas vide
    return Container(
      height: 5,
      margin: EdgeInsets.all(2),
      color: color,
    );
  }

  PasswordStrength _calculatePasswordStrength(String password) {
    // Ajoutez votre logique de calcul de la force du mot de passe ici
    // Vous pouvez vérifier la longueur, la complexité, les caractères spéciaux, etc.
    // Pour cet exemple, nous utilisons une logique simplifiée.

    if (password.isEmpty) {
      return PasswordStrength
          .weak; // Mot de passe vide, force faible par défaut
    } else if (password.length >= 8) {
      return PasswordStrength.strong;
    } else if (password.length >= 6) {
      return PasswordStrength.medium;
    } else {
      return PasswordStrength.weak;
    }
  }
}
