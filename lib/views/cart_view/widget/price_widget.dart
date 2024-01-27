import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncc_app/views/cart_view/widget/price_text.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key, required this.total}) : super(key: key);

  final num total;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal:   height * 0.022,vertical:height * 0.01 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(FontAwesomeIcons.truck,size: 19,),
              SizedBox(width: width * 0.02,),
              const Text(
                'Free delivery on orders Over',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const Text(
                '100 JOD',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 17
                ),
              )
            ],
          ),
          SizedBox(height: height * 0.02,),
          const Divider(
            color: Colors.black26,
            thickness: 0.5,
            indent: 10,
            endIndent: 10,
            height: 1,
          ),
          SizedBox(height: height * 0.02,),
          // PriceText(text: 'Total :', price: '$total JOD', discount: false),
          // SizedBox(height: height * 0.02,),
        ],
      ),
    );
  }
}
