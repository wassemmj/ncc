import 'package:flutter/material.dart';

import '../../../core/color1.dart';

class DetailsAvWidget extends StatelessWidget {
  const DetailsAvWidget({Key? key, required this.code, required this.ava}) : super(key: key);

  final String code;
  final String ava;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54.withOpacity(0.03),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.all(height * 0.02),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Availability : ',
                style: TextStyle(
                  color: Color1.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ava,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02,),
          Row(
            children: [
              const Text(
                'Product Code : ',
                style: TextStyle(
                  color: Color1.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                code,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
