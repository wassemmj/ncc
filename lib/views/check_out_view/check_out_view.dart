import 'package:flutter/material.dart';
import 'package:ncc_app/views/admin/awidget/custom_text_from_field.dart';
import 'package:ncc_app/views/admin/awidget/phone_from_field.dart';
import 'package:ncc_app/views/check_out_view/widget/check_out_button.dart';
import 'package:ncc_app/views/nav_view/nav_view.dart';

import '../../core/color1.dart';
import '../../core/style.dart';
import '../nav_view/widget/appbar_icon.dart';

class CheckOut extends StatelessWidget {
  CheckOut({Key? key}) : super(key: key);

  var addressController = TextEditingController();
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all((height / 108)),
          child: AppbarIcon(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const NavView(),));
            },
            color: Colors.black54.withOpacity(0.03),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.15),
              Text(
                'Check Out',
                style: Style.textStyle23,
              ),
              SizedBox(height: height * 0.003),
              const Text(
                'to make an order done',
                style: Style.textStyle14,
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                cursorColor: Color1.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Location',
                  floatingLabelStyle: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 22),
                  focusColor: Color1.primaryColor,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                  iconColor: Color1.primaryColor,
                  prefixIcon: const Icon(
                      Icons.location_on_outlined
                    // color: Color1.black,
                  ),
                ),
                maxLines: 2,
                controller: addressController,
              ),
              SizedBox(height: height * 0.02),
              PhoneFromField(onChanged: (phone) {
                phoneNumber = phone!.completeNumber;
              },),
              SizedBox(height: height * 0.02),
              CheckOutButton(number: phoneNumber, address: addressController.text),
            ],
          ),
        ),
      ),
    );
  }
}
