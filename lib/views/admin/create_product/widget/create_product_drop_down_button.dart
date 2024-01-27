import 'package:flutter/material.dart';

import '../../../../core/color1.dart';

class CreateProductDropDownButton extends StatelessWidget {
  const CreateProductDropDownButton({Key? key, required this.text, required this.onChanged, required this.items, required this.value}) : super(key: key);

  final String text;
  final Function(String? val) onChanged;
  final List<String> items;
  final String value;



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 14,
              color: Color1.black,
              fontWeight: FontWeight.w500),
        ),
        DropdownButton(
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items,style: const TextStyle(fontSize: 13),),
            );
          }).toList(),
          icon: const Icon(Icons.keyboard_arrow_down),
          value: value,
          onChanged: onChanged,
          iconEnabledColor: Color1.primaryColor,
        ),
      ],
    );
  }
}

