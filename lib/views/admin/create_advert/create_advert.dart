import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncc_app/views/admin/create_advert/widget/create_advert_button.dart';
import 'package:ncc_app/views/admin/create_product/widget/create_product_drop_down_button.dart';

import '../../../core/style.dart';
import '../../nav_view/widget/appbar_icon.dart';
import '../awidget/custom_text_from_field.dart';

class CreateAdvert extends StatefulWidget {
  const CreateAdvert({Key? key}) : super(key: key);

  @override
  State<CreateAdvert> createState() => _CreateAdvertState();
}

class _CreateAdvertState extends State<CreateAdvert> {

  File? pickedImage;
  var advertText = TextEditingController();

  List<String> items = [
    'Select Type',
    'New Laptop',
    'coupon',
    '34'
  ];

  String? value = 'Select Type';

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
              Navigator.of(context).pop();
            }, color: Colors.black54.withOpacity(0.03),
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
                SizedBox(height: height * 0.15),
                Text(
                  'Create Advert',
                  style: Style.textStyle23,
                ),
                SizedBox(height: height * 0.05),
                pickedImage!=null ? Center(
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(80),
                      child:  Image.file(
                        pickedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ) : Container(),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image == null) {
                          return;
                        }
                        setState(() {
                          pickedImage = File(image.path);
                        });
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                          elevation: MaterialStateProperty.all(10),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)))),
                      child: const Text(
                        'Choose photo',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )),
                ),
                SizedBox(height: height * 0.02),
                CustomTextFromField(controller: advertText, hint: 'Advert Text', iconData: Icons.add),
                SizedBox(height: height * 0.02),
                CreateAdvertButton(image: pickedImage,type: advertText.text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
