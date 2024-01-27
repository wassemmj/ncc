import 'package:flutter/material.dart';
import 'package:ncc_app/views/admin/create_product/widget/create_product_drop_down_button.dart';
import 'package:ncc_app/views/admin/create_product/widget/create_product_type.dart';

import '../../../../core/color1.dart';
import '../../awidget/custom_text_from_field.dart';

class CreateProductChapterTwo extends StatelessWidget {
  const CreateProductChapterTwo({Key? key, required this.code, required this.availability, required this.getImages, required this.selectedImages, required this.items, required this.value, required this.onChanged, required this.activeId, required this.funType}) : super(key: key);

  final TextEditingController code;
  final TextEditingController availability;
  final Function() getImages;
  final List selectedImages;
  final List<String> items;
  final String value;
  final Function(String? value) onChanged;

  final TextEditingController activeId;
  final TextEditingController funType;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width,
          child: selectedImages.isEmpty
              ? Container()
              : GridView.builder(
            shrinkWrap: true,
            itemCount: selectedImages.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3
            ),
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Image.file(selectedImages[index]));
            },
          ),
        ),
        SizedBox(height: height * 0.02),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.all(8)),
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)))),
            child: const Text(
              'Choose Product Photos',
              style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400,),
            ),
            onPressed: () {
              getImages();
            },
          ),
        ),
        SizedBox(height: height * 0.02),

        SizedBox(height: height * 0.02),
        CustomTextFromField(
          controller: code,
          hint: 'Product Code',
          iconData: Icons.code_outlined,
        ),
        // SizedBox(height: height * 0.02),
        // CustomTextFromField(
        //   controller: availability,
        //   hint: 'Product Availability',
        //   iconData: Icons.code_outlined,
        // ),
        SizedBox(height: height * 0.02),
        CreateProductDropDownButton(text: 'Type : ', onChanged: onChanged, items: items, value: value),
        SizedBox(height: height * 0.02),
        CreateProductType(activeId: activeId, funType: funType),
      ],
    );
  }
}
