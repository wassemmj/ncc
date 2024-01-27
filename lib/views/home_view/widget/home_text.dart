import 'package:flutter/material.dart';
import 'package:ncc_app/views/home_view/widget/show_more_view.dart';

import '../../../core/style.dart';

class HomeText extends StatelessWidget {
  const HomeText({Key? key, required this.text1, required this.text2, required this.type}) : super(key: key);

  final String text1;
  final String text2;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: Style.textStyle22,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowMoreView(type: type),));
          },
          child: Text(
            text2,
            style: Style.textStyle14,
          ),
        ),
      ],
    );
  }
}
