import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/color1.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key, required this.iconData, required this.text}) : super(key: key);

  final IconData iconData;

  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Color1.white,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     offset: Offset(0.0, 1.0), //(x,y)
            //     blurRadius: 6.0,
            //   ),
            // ],
            border: Border.all(color: Colors.black54.withOpacity(0.04)),
        ),
        child:  ListTile(
          leading: Icon(iconData,color: Color1.black,),
          title: Text(
            text,
            style: const TextStyle(
              color: Color1.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
