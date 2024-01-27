import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncc_app/views/admin/awidget/custom_text_from_field.dart';
import 'package:ncc_app/views/admin/create_product/widget/create_product_drop_down_button.dart';
import 'package:ncc_app/views/admin/create_section/widget/create_section_button.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../../logic/cat_cubit/cat_cubit.dart';
import '../../nav_view/widget/appbar_icon.dart';

class CreateSection extends StatefulWidget {
  const CreateSection({Key? key}) : super(key: key);

  @override
  State<CreateSection> createState() => _CreateSectionState();
}

class _CreateSectionState extends State<CreateSection> {
  var secName = TextEditingController();
  File? pickedImage;
  int id = 0;

  String? value = 'Select Type';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<CatCubit>(context).getCat();
    });
    super.initState();
  }

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
                }, color: Colors.black54.withOpacity(0.03),)),
      ),
      body: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        child: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            if (BlocProvider.of<CatCubit>(context).category == null) {
              return Container(
                alignment: Alignment.center,
                height: height * 0.8,
                child: CircularProgressIndicator(
                  color: Color1.primaryColor,
                  strokeWidth: 1,
                ),
              );
            }
            List category = BlocProvider.of<CatCubit>(context).category['category'];
            List<String> items = ['Select Type'];
            for(int i=0;i<category.length;i++) {
              items.add(category[i]['type']);
            }
            return SafeArea(
              child: Container(
                padding: EdgeInsets.all(height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.15),
                    Text(
                      'Create Section',
                      style: Style.textStyle23,
                    ),
                    SizedBox(height: height * 0.05),
                    pickedImage != null
                        ? Center(
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(80),
                                child: Image.file(
                                  pickedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : Container(),
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
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(8)),
                              elevation: MaterialStateProperty.all(10),
                              backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          child: const Text(
                            'Choose photo',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFromField(
                        controller: secName,
                        hint: 'Section Name',
                        iconData: Icons.category_outlined),
                    SizedBox(height: height * 0.02),
                    CreateProductDropDownButton(text: 'Category name : ', onChanged: (val) {
                      List l = (category.where((element) => element['type']==val).toList());
                      setState(() {
                        value = val;
                        id = l[0]['id'];
                      });
                    }, items: items, value: value!),
                    SizedBox(height: height * 0.02),
                    CreateSectionButton(
                      type: secName.text,
                      catId: id,
                      image: pickedImage,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
