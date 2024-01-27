import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncc_app/views/admin/awidget/custom_text_from_field.dart';
import 'package:ncc_app/views/admin/edit_company_details/widget/edit_company_button.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../nav_view/widget/appbar_icon.dart';
import '../awidget/phone_from_field.dart';

class EditCompanyDetails extends StatefulWidget {
  const EditCompanyDetails(
      {Key? key,
      required this.description,
      required this.location,
      required this.email,
      required this.numberOne,
      required this.numberTwo,
      required this.numberThree,
      required this.facebook,
      required this.instagram,
      required this.twitter,
      required this.id})
      : super(key: key);

  final int id;
  final String description;
  final String location;
  final String email;
  final String numberOne;
  final String numberTwo;
  final String numberThree;
  final String facebook;
  final String instagram;
  final String twitter;

  @override
  State<EditCompanyDetails> createState() => _EditCompanyDetailsState();
}

class _EditCompanyDetailsState extends State<EditCompanyDetails> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController(text: widget.email);
    var addressController = TextEditingController(text: widget.location);
    var descController = TextEditingController(text: widget.description);
    var fAccountController = TextEditingController(text: widget.facebook);
    var iAccountController = TextEditingController(text: widget.instagram);
    var tAccountController = TextEditingController(text: widget.twitter);

    List<String> numbers = [];
    String phone1 = widget.numberOne;
    String phone2 = widget.numberTwo;
    String phone3 = widget.numberThree;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          child: Padding(
            padding: EdgeInsets.all(height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Footer',
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
                PhoneFromField(
                    onChanged: (phone) {
                      if (phone!.completeNumber == phone.countryCode) {
                        phone1 = '';
                      } else {
                        phone1 = phone.number;
                      }
                    }),
                SizedBox(height: height * 0.02),
                phone1 == ''
                    ? Container()
                    : PhoneFromField(
                        onChanged: (phone) {
                          if (phone!.completeNumber == phone.countryCode) {
                            phone2 = '';
                          } else {
                            phone2 = phone.number;
                          }
                        }),
                SizedBox(height: phone1 != '' ? height * 0.02 : 0),
                phone2 == ''
                    ? Container()
                    : PhoneFromField(
                        onChanged: (phone) {
                          if (phone!.completeNumber == phone.countryCode) {
                            phone3 = '';
                          } else {
                            phone3 = phone.number;
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
                CustomTextFromField(
                    controller: tAccountController,
                    hint: 'Twitter Account',
                    iconData: FontAwesomeIcons.twitter),
                SizedBox(height: height * 0.02),
                Builder(builder: (context) {
                  numbers = [phone1, phone2, phone3];
                  return EditCompanyButton(
                      id: widget.id,
                      email: emailController.text,
                      address: addressController.text,
                      description: descController.text,
                      numbers: numbers,
                      fAccount: fAccountController.text,
                      iAccount: iAccountController.text,
                      tAccount: tAccountController.text);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
