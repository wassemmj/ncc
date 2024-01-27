import 'package:flutter/material.dart';
import 'package:ncc_app/core/color1.dart';
import 'package:ncc_app/views/admin/user_view/widget/user_widget.dart';
import 'package:ncc_app/views/cart_view/widget/price_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/style.dart';

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;
  final Map order;

  const ExpandableContainer({
    super.key,
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 300.0,
    this.expanded = true,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0, color: Colors.black54.withOpacity(0.06))),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: screenWidth,
          height: expanded ? expandedHeight : collapsedHeight,
          child: child,
        ),
        Container(
          height: screenHeight * 0.12,
          margin: EdgeInsets.all(screenHeight * 0.022),
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black54, width: 0.2),
              )),
          child: Row(
            children: [
              Container(
                width:screenWidth * 0.3,
                height: screenHeight * 0.10,
                decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        image: AssetImage(
                          'image/user.png',
                        ),
                        fit: BoxFit.fitHeight)),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: screenWidth / 2.2,
                    child: Text(
                      order['email'],
                      style: const TextStyle(
                          letterSpacing: 0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                      maxLines: 2,
                    ),
                  ),
                  TextButton(
                    onPressed: () => launchUrl(Uri.parse("tel://${order['phone_number']}")),
                    child: Text(
                      order['phone_number'].toString(),
                      style: Style.textStyle14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          order['shipping_address'],
          style: const TextStyle(
            color: Color1.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
          child: PriceText(
              text: 'Total ',
              price: '${order['total_amount']} JOD',
              discount: false),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
      ],
    );
  }
}
