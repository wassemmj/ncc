import 'package:flutter/material.dart';

import '../../../../core/color1.dart';
import '../../awidget/custom_text_from_field.dart';

class CreateProductChapterOne extends StatelessWidget {
  const CreateProductChapterOne({Key? key, required this.name, required this.brand, required this.desc, required this.price, required this.quantity}) : super(key: key);

  final TextEditingController name;
  final TextEditingController brand;
  final TextEditingController desc;
  final TextEditingController price;
  final TextEditingController quantity;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomTextFromField(
            controller: name,
            hint: 'Product Name',
            iconData: Icons.category_outlined),
        SizedBox(height: height * 0.02),
        CustomTextFromField(
            controller: brand,
            hint: 'Product Brand',
            iconData: Icons.category_outlined),
        SizedBox(height: height * 0.02),
        TextFormField(
          cursorColor: Color1.primaryColor,
          decoration: InputDecoration(
            labelText: 'Description',
            floatingLabelStyle: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 22),
            focusColor: Color1.primaryColor,
            labelStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
          maxLines: 8,
          maxLength: 1000,
          controller: desc,
        ),
        SizedBox(height: height * 0.02),
        CustomTextFromField(
          controller: price,
          hint: 'Price',
          iconData: Icons.attach_money_outlined,
        ),
        SizedBox(height: height * 0.02),
        CustomTextFromField(
          controller: quantity,
          hint: 'Product Quantity',
          iconData: Icons.numbers_outlined,
        ),
        SizedBox(height: height * 0.04),
      ],
    );
  }
}
