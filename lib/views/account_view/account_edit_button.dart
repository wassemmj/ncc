import 'package:flutter/material.dart';

import '../../core/color1.dart';
import '../awidget/edit_user_alert.dart';

class AccountEditButton extends StatelessWidget {
  const AccountEditButton({Key? key, required this.nameT, required this.emailT, required this.addressT}) : super(key: key);

  final String nameT;
  final String emailT;
  final String addressT;


  @override
  Widget build(BuildContext context) {
    var name = TextEditingController(text: nameT);
    var email = TextEditingController(text: emailT);
    var address = TextEditingController(text: addressT );
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: () {
            showDialog(context: context, builder: (context) {
              return EditUserAlert(name: name, email: email, address: address);
            }, );
          },
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
              elevation: MaterialStateProperty.all(10),
              backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)))),
          child: const Text(
            'Edit My Account',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400),
          )),
    );
  }
}
