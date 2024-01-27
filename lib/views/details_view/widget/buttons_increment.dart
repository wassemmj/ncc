import 'package:flutter/material.dart';
import 'package:ncc_app/core/color1.dart';

import '../../../core/style.dart';

class ButtonIncrement extends StatelessWidget {
  const ButtonIncrement({Key? key, required this.quantity, required this.onChanged}) : super(key: key);

  final int quantity;
  final Function(int check) onChanged;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(height * 0.005),
      margin: EdgeInsets.only(right: height * 0.01),
      decoration: BoxDecoration(
        color: Colors.black54.withOpacity(0.07),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          buildButtons(Colors.white, Icons.remove, 1, Colors.black),
          Padding(
            padding: EdgeInsets.all(height * 0.005),
            child: Text(
              '$quantity',
              style: Style.textStyle18,
            ),
          ),
          buildButtons(Colors.black, Icons.add, 2, Colors.white),
        ],
      ),
    );
  }

  GestureDetector buildButtons(
      Color containerColor, IconData iconData, int check, Color iconColor) {
    return GestureDetector(
      onTap: () {
        onChanged(check);
      },
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: containerColor,
            border: Border.all(color: Color1.black)),
        child: Center(
            child: Icon(
          iconData,
          color: iconColor,
          size: 18,
        )),
      ),
    );
  }
}
