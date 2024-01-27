import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncc_app/logic/create_cubit/create_cubit.dart';
import 'package:ncc_app/views/admin/create_product/widget/create_product_button.dart';
import 'package:ncc_app/views/admin/create_product/widget/create_product_chapert_one.dart';
import 'package:ncc_app/views/admin/create_product/widget/create_product_chapter_two.dart';

import '../../../core/style.dart';
import '../../nav_view/widget/appbar_icon.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  File? pickedImage;

  List<File> selectedImages = [];
  final picker = ImagePicker();

  var name = TextEditingController();
  var brand = TextEditingController();
  var desc = TextEditingController();
  var price = TextEditingController();
  var quantity = TextEditingController();
  var code = TextEditingController();
  var availability = TextEditingController();

  int index = 0;
  List chapters = [];

  String value = 'Select Type';
  List<String> items = ['Select Type', 'NEW', 'USED'];

  int cId = 0;
  int sId = 0;

  String? valueCat = 'Select Type';
  String? valueSec = 'Select Type';

  var activeId = TextEditingController();
  var funType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    chapters = [
      CreateProductChapterOne(
          name: name,
          brand: brand,
          desc: desc,
          price: price,
          quantity: quantity),
      CreateProductChapterTwo(
        code: code,
        availability: availability,
        getImages: getImages,
        selectedImages: selectedImages,
        items: items,
        value: value,
        onChanged: (val) {
          setState(() {
            value = val!;
          });
        },
        activeId: activeId,
        funType: funType,
      ),
    ];
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            padding: EdgeInsets.all((height / 108)),
            child: AppbarIcon(
              icon: Icons.arrow_back,
              onPressed: () {
                if (index != 0) {
                  setState(() {
                    index--;
                  });
                } else {
                  Navigator.of(context).pop();
                }
              },
              color: Colors.black54.withOpacity(0.03),
            )),
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
                  'Create Product',
                  style: Style.textStyle23,
                ),
                SizedBox(height: height * 0.04),
                chapters[index],
                index != chapters.length - 1
                    ? CreateProductButton(
                        onPressed: () {
                          setState(() {
                            index = index + 1;
                          });
                          print(index);
                        },
                        text: 'Next',
                      )
                    : CreateProductButton(
                        onPressed: () async {
                          print(activeId.text);
                          await BlocProvider.of<CreateCubit>(context)
                              .createProduct(
                                  int.parse(activeId.text),
                                  funType.text,
                                  selectedImages,
                                  value,
                                  price.text,
                                  name.text,
                                  availability.text,
                                  code.text,
                                  brand.text,
                                  desc.text,
                                  quantity.text);
                        },
                        text: 'Create',
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    List<XFile> xFilePick = pickedFile;

    if (xFilePick.isNotEmpty) {
      for (var i = 0; i < xFilePick.length; i++) {
        selectedImages.add(File(xFilePick[i].path));
      }
      setState(
        () {},
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    }
  }
}
