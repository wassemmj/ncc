import 'package:flutter/material.dart';

import '../../../core/color1.dart';

class AngleAuth extends StatelessWidget {
  const AngleAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 0,),
        Container(
          alignment: Alignment.topRight,
          height: height * 0.2,
          width: width * 0.45,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(500),bottomLeft: Radius.circular(1000) ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Color1.primaryColor,
                  Color1.primaryColor,
                  Color1.primaryColor,
                  Color1.primaryColor.withOpacity(0.7),
                  Color1.primaryColor.withOpacity(0.7),
                ],
              )
          ),
        ),
      ],
    );
  }
}
