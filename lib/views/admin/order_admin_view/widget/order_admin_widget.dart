import 'package:flutter/material.dart';

import '../../../../core/api.dart';
import '../../../../core/style.dart';
import '../../../awidget/fav_button.dart';

class OrderAdminWidget extends StatelessWidget {
  const OrderAdminWidget({Key? key, required this.product}) : super(key: key);

  final Map product;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.17,
      margin: EdgeInsets.all(height * 0.022),
      decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black54, width: 0.2),
          )),
      child: Row(
        children: [
          Container(
            width: width * 0.3,
            height: height * 0.11,
            decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.04),
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: NetworkImage(
                      '${Api.apiImage}/images/${product['image']}',
                    ),
                    fit: BoxFit.contain)),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.57,
                child: Text(
                  product['name'],
                  style: const TextStyle(
                      letterSpacing: 0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                  maxLines: 3,
                ),
              ),
              SizedBox(height: (height * 0.02)),
              Text(
                product['Brand'],
                style: Style.textStyle14,
              ),
              SizedBox(height: (height * 0.001)),
              Row(
                children: [
                  Text(
                    '${product['Unit_Price_After_Discount']} JOD',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  SizedBox(width: (width * 0.2)),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: Text(
                      '${product['Quntity']}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
