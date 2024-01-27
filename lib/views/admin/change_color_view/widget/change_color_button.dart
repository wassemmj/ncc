import 'package:flutter/material.dart';

import '../../../../core/color1.dart';

class ChangeColorButton extends StatelessWidget {
  const ChangeColorButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Color1.primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
