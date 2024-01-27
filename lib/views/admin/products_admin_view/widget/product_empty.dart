import 'package:flutter/material.dart';

import '../../../../core/color1.dart';

class ProductEmpty extends StatelessWidget {
  const ProductEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Text(
        'Wait our New Products',
        style: TextStyle(color: Color1.primaryColor,fontSize: 20,fontWeight: FontWeight.w500),
      ),
    );
  }
}
