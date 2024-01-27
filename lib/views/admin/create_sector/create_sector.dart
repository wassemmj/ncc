import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/create_product/widget/create_product_drop_down_button.dart';
import 'package:ncc_app/views/admin/create_sector/widget/create_sector_button.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../../logic/cat_cubit/cat_cubit.dart';
import '../../nav_view/widget/appbar_icon.dart';
import '../awidget/custom_text_from_field.dart';

class CreateSector extends StatefulWidget {
  const CreateSector({Key? key}) : super(key: key);

  @override
  State<CreateSector> createState() => _CreateSectorState();
}

class _CreateSectorState extends State<CreateSector> {
  var sectorName = TextEditingController();

  int id = 0;
  int sId = 0;

  String? value = 'Select Type';
  String? valueSec = 'Select Type';

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
      body: SafeArea(
        child: SingleChildScrollView(
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
              List section = [];
              List<String> sectionName = [];
              return Container(
                padding: EdgeInsets.all(height * 0.02),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.15),
                    Text(
                      'Create Sector',
                      style: Style.textStyle23,
                    ),
                    SizedBox(height: height * 0.05),
                    CustomTextFromField(
                        controller: sectorName,
                        hint: 'Sector Name',
                        iconData: Icons.category_outlined),
                    SizedBox(height: height * 0.02),
                    CreateProductDropDownButton(text: 'Category name : ', onChanged: (val) async {
                      List l = (category
                          .where((element) => element['type'] == val)
                          .toList());
                      setState(() {
                        value = val;
                        valueSec = 'Select Type';
                        id = l[0]['id'];
                      });
                      await BlocProvider.of<CatCubit>(context).getSec(id,'desc');
                    }, items: items, value: value!),
                    SizedBox(height: height * 0.02),
                    value!='Select Type'? Builder(builder: (context) {
                      return BlocBuilder<CatCubit,CatState>(
                        builder: (context, state) {
                          if(state.status == CatStatus.loading) {
                            return const CircularProgressIndicator();
                          }
                          section = BlocProvider.of<CatCubit>(context).section['section'];
                          sectionName.add('Select Type');
                          for(int i=0;i<section.length;i++) {
                            sectionName.add(section[i]['Section_type']);
                          }
                          return CreateProductDropDownButton(text: 'Section name : ', onChanged: (val) async {
                            List l = (section
                                .where((element) => element['Section_type'] == val)
                                .toList());
                            setState(() {
                              valueSec = val;
                              sId = l[0]['id'];
                            });
                          }, items: sectionName, value: valueSec!);
                        },
                      );
                    },):Container(),
                    value!='Select Type'? SizedBox(height: height * 0.02) : Container(),
                    CreateSectorButton(
                      sectorName: sectorName.text,
                      secId: sId,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
