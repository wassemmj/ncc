import 'package:flutter/material.dart';

import '../../../core/color1.dart';

class PriceText extends StatelessWidget {
  const PriceText({Key? key, required this.text, required this.price, required this.discount}) : super(key: key);

  final String text;
  final String price;
  final bool discount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        Text(
          price,
          style: TextStyle(
              color: discount ? Colors.red : Color1.black,
              fontWeight: FontWeight.w500,
              fontSize: 17
          ),
        ),
      ],
    );
  }
}
