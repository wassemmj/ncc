import 'package:flutter/material.dart';

import '../../core/color1.dart';

class AccountTextWidget extends StatelessWidget {
  const AccountTextWidget({Key? key, required this.text1, required this.text2}) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(height * 0.02),
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black54.withOpacity(0.04))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: const TextStyle(
                color: Color1.black,
                fontSize: 19,
                fontWeight: FontWeight.w400),
          ),
          Text(
            text2,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
