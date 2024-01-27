import 'package:flutter/material.dart';
import 'package:ncc_app/core/color1.dart';

import '../../cart_view/cart_view.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon({Key? key, required this.icon, required this.onPressed, required this.color}) : super(key: key);

  final IconData icon;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: (height / 21.68),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Color1.black,
          size: (height * 0.025),
        ),
      ),
    );
  }
}

