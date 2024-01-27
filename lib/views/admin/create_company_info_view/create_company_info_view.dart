import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncc_app/views/admin/awidget/custom_text_from_field.dart';
import 'package:ncc_app/views/admin/awidget/phone_from_field.dart';
import 'package:ncc_app/views/admin/create_company_info_view/widget/create_company_info_button.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../nav_view/widget/appbar_icon.dart';

class CreateCompanyInfoView extends StatefulWidget {
  const CreateCompanyInfoView({Key? key}) : super(key: key);

  @override
  State<CreateCompanyInfoView> createState() => _CreateCompanyInfoViewState();
}

class _CreateCompanyInfoViewState extends State<CreateCompanyInfoView> {
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var descController = TextEditingController();
  var fAccountController = TextEditingController();
  var iAccountController = TextEditingController();

  List<String> numbers = [];
  String phone1 = '';
  String phone2 = '';
  String phone3 = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all((height / 108)),
          child: AppbarIcon(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.black54.withOpacity(0.03),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Footer',
                  style: Style.textStyle23,
                ),
                SizedBox(height: height * 0.02),
                CustomTextFromField(
                    controller: emailController,
                    hint: 'Email Address',
                    iconData: Icons.email_outlined),
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
                  maxLines: 4,
                  maxLength: 500,
                  controller: descController,
                ),
                SizedBox(height: height * 0.02),
                CustomTextFromField(
                    controller: addressController,
                    hint: 'Address',
                    iconData: Icons.location_on_outlined),
                SizedBox(height: height * 0.02),
                PhoneFromField(onChanged: (phone) {
                  if(phone!.completeNumber == phone.countryCode) {
                    phone1 = '';
                  }
                  else {
                    phone1 = phone.completeNumber;
                  }
                }),
                SizedBox(height: height * 0.02),
                phone1 == '' ? Container() : PhoneFromField(onChanged: (phone) {
                  if(phone!.completeNumber == phone.countryCode) {
                    phone2 = '';
                  }
                  else {
                    phone2 = phone.completeNumber;
                  }
                }),
                SizedBox(height: phone1 != '' ? height * 0.02 : 0),
                phone2 == '' ? Container() : PhoneFromField(onChanged: (phone) {
                  if(phone!.completeNumber == phone.countryCode) {
                    phone3 = '';
                  }
                  else {
                    phone3 = phone.completeNumber;
                  }
                }),
                SizedBox(height: phone2 != '' ? height * 0.02 : 0),
                CustomTextFromField(
                    controller: fAccountController,
                    hint: 'Facebook Account',
                    iconData: Icons.facebook_outlined),
                SizedBox(height: height * 0.02),
                CustomTextFromField(
                    controller: iAccountController,
                    hint: 'Instagram Account',
                    iconData: FontAwesomeIcons.instagram),
                SizedBox(height: height * 0.02),
                Builder(
                  builder: (context) {
                    numbers = [phone1,phone2,phone3];
                    return CreateCompanyInfoButton(
                        email: emailController.text,
                        address: addressController.text,
                        description: descController.text,
                        numbers: numbers,
                        fAccount: fAccountController.text,
                        iAccount: iAccountController.text,
                        tAccount: "fdfd");
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}