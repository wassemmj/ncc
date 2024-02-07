import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../admin/order_admin_view/widget/order_admin_widget.dart';
import '../../cart_view/widget/price_text.dart';

class AllOrderWidget extends StatefulWidget {
  const AllOrderWidget({super.key, required this.order, required this.index});

  final order ;
  final int index ;

  @override
  State<AllOrderWidget> createState() => _AllOrderWidgetState();
}

class _AllOrderWidgetState extends State<AllOrderWidget> {
  bool expandFlag = false ;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'order ${widget.index + 1}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Icon(
                    widget.order['status'] == 'accepted'
                        ? Icons.done
                        : widget.order['status'] != 'rejected'
                        ? Icons.access_time_outlined
                        : FontAwesomeIcons.x,
                    color: widget.order['status'] == 'rejected' ? Colors.red :  Colors.black,
                    size: 20,
                  ),
                  SizedBox(width: widget.order['status'] == 'rejected' ? 0 : 10),
                  widget.order['status'] == 'rejected' ? Container() : Icon(
                    widget.order['location'] == 'In Stock'
                        ? FontAwesomeIcons.truckFast
                        : widget.order['location'] != 'Arrived'
                        ? FontAwesomeIcons.truckArrowRight
                        : FontAwesomeIcons.truckFront,
                    color: Colors.black,
                    size: 20,
                  ) ,
                  IconButton(
                      icon: Icon(
                        expandFlag
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      onPressed: () {
                        setState(() {
                          expandFlag = !expandFlag;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0,
                  color: Colors.black54.withOpacity(0.06))),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: width,
          height: expandFlag
              ? (height * 0.22) *
              widget.order['products'].length
              : 0,
          child: SizedBox(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, ind) {
                return OrderAdminWidget(
                  product: widget.order['products'][ind],
                );
              },
              itemCount: widget.order['products'].length,
            ),
          ),
        ),
        Text(
          widget.order['shipping_address'],
          style: const TextStyle(
            color: Color1.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
        ),
        TextButton(
          onPressed: () => launchUrl(Uri.parse("tel://${widget.order['phone_number']}")),
          child: Text(
            widget.order['phone_number'].toString(),
            style: Style.textStyle14,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: height * 0.02),
          child: PriceText(
              text: 'Total ',
              price: '${widget.order['total_amount']} JOD',
              discount: false),
        ),
      ],
    );
  }
}
