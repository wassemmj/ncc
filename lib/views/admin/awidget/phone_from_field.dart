import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../core/color1.dart';

class PhoneFromField extends StatelessWidget {
  const PhoneFromField({Key? key, required this.onChanged}) : super(key: key);

  final Function(PhoneNumber?) onChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      cursorColor: Color1.primaryColor,
      initialValue: '+962',
      disableLengthCheck: true,
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: onChanged,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w400,
            fontSize: 22),
        focusColor: Color1.primaryColor,
        labelText: 'Phone Number',
        labelStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400),
        suffixIcon: Icon(
          Icons.phone,
          color: Color1.primaryColor,
        ),
      ),
    );
  }
}
