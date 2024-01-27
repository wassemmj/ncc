import 'package:flutter/material.dart';
import 'package:ncc_app/views/admin/awidget/delete_button.dart';
import 'package:ncc_app/views/admin/awidget/discount_button.dart';
import 'package:ncc_app/views/admin/awidget/edit_button.dart';

import '../../../../core/color1.dart';
import '../../../../core/style.dart';
import '../../../details_view/widget/description.dart';
import '../../../details_view/widget/details_av_widget.dart';
import '../../../details_view/widget/details_text.dart';

class DetailsAdminAdvert extends StatelessWidget {
  const DetailsAdminAdvert(
      {Key? key,
      required this.price,
      required this.name,
      required this.discount,
      required this.brand,
      required this.description,
      this.discountPrice,
      required this.id,
      required this.ava,
      required this.code,
      required this.more,
      required this.moreDetails,
      required this.discountId, required this.quantity})
      : super(key: key);

  final String price;
  final String name;
  final bool discount;
  final String brand;
  final String description;
  final num? discountPrice;
  final int id;
  final String ava;
  final String code;
  final bool more;
  final int discountId;
  final Map moreDetails;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(height * 0.02),
      decoration: const BoxDecoration(
        color: Color1.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), topLeft: Radius.circular(50)),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
              maxLines: 3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.01),
                  DetailsText(text: brand, style: Style.textStyle14),
                  SizedBox(height: height * 0.015),
                  Row(
                    children: [
                      DetailsText(
                          text: discount ? '${int.parse(price) * (discountPrice!/100) } JOD  '  : '$price JOD  ',
                          style: const TextStyle(
                            color: Color1.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          )),
                      discount
                          ? DetailsText(
                              text: '$price JOD',
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 17,
                              ))
                          : Container(),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  DeleteButton(id: id),
                  const SizedBox(width: 5,),
                  DiscountButton(
                      id: id, type: 1, deleteId: discountId),
                  const SizedBox(width: 5,),
                  EditButton(id: id, lastPrice: price.toString(), lastQuantity: quantity.toString(), ava: ava,)
                ],
              )
            ],
          ),
          SizedBox(height: height * 0.02),
          Description(text: description),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              const Text(
                'Quantity : ',
                style: TextStyle(
                  color: Color1.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                quantity.toString(),
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          DetailsAvWidget(code: code, ava: ava),
        ],
      ),
    );
  }
}
