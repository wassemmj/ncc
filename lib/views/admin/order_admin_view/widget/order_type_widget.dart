import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/color1.dart';

class OrderTypeWidget extends StatelessWidget {
  OrderTypeWidget({Key? key, required this.onChanged, required this.currentIndex}) : super(key: key);

  final Function(int index) onChanged;
  final int currentIndex;

  List items = [
    {
      'icons' : FontAwesomeIcons.truckMoving,
      'text' : 'All Order'
    },
    {
      'icons' : FontAwesomeIcons.truckFast,
      'text' : 'To ship'
    },
    {
      'icons' : FontAwesomeIcons.truckArrowRight,
      'text' : 'On way'
    },
    {
      'icons' : FontAwesomeIcons.truckFront,
      'text' : 'Shipped'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.09,
      child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => onChanged(index),
            child: Container(
              width: width * 0.25,
              padding: EdgeInsets.all(height * 0.02),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: currentIndex==index ? Color1.primaryColor : Colors.transparent,
                      )
                  )
              ),
              child: Column(
                children:  [
                  Icon(items[index]['icons'],size: height * 0.027,),
                  Text(items[index]['text'],style: TextStyle(color: Color1.black,fontSize: height * 0.015),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
