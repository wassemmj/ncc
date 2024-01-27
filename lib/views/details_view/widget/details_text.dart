import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  const DetailsText({Key? key, required this.text, required this.style})
      : super(key: key);

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
