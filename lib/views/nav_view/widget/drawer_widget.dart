import 'package:flutter/material.dart';

import '../../../core/color1.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.f, required this.text, required this.iconData}) : super(key: key);

  final Function() f;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: f,
      leading:
      Icon(iconData, size: 22, color: Colors.black),
      title: Text(text,style: const TextStyle(color: Color1.black,fontSize: 15),),
      textColor: Colors.black,
      dense: true,
      // padding: EdgeInsets.zero,
    );
  }
}
