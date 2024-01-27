import 'package:flutter/material.dart';
import 'package:ncc_app/views/admin/awidget/custom_text_from_field.dart';
import 'package:ncc_app/views/admin/create_category/widget/create_button.dart';

import '../../../core/style.dart';
import '../../nav_view/widget/appbar_icon.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({Key? key}) : super(key: key);

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  var catName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(padding: EdgeInsets.all((height / 108)),child: AppbarIcon(icon: Icons.arrow_back, onPressed: () {Navigator.of(context).pop();}, color: Colors.black54.withOpacity(0.03),)),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(height * 0.02),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.15),
              Text(
                'Create Category',
                style: Style.textStyle23,
              ),
              SizedBox(height: height * 0.05),
              CustomTextFromField(controller: catName, hint: 'Category Name', iconData: Icons.category_outlined),
              SizedBox(height: height * 0.02),
              CreateButton(type: catName.text,),
            ],
          ),
        ),
      ),
    );
  }
}
