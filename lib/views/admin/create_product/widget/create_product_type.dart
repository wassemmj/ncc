import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/create_product/widget/create_product_drop_down_button.dart';

import '../../../../core/color1.dart';
import '../../../../logic/cat_cubit/cat_cubit.dart';

class CreateProductType extends StatefulWidget {
  const CreateProductType({Key? key, required this.activeId, required this.funType,}) : super(key: key);

  final TextEditingController activeId;
  final TextEditingController funType;

  @override
  State<CreateProductType> createState() => _CreateProductTypeState();
}

class _CreateProductTypeState extends State<CreateProductType> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<CatCubit>(context,listen: false).getCat();
    });
    super.initState();
  }

  String value = 'Select Type';
  List<String> items = [];

  String valueSec = 'Select Type';
  List<String> itemsSec = [];

  int cId = 0;
  int sId = 0;
  int secId = 0;

  String valueSector = 'Select Type';
  List<String> sectorName = [];

  int activeId = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        if (state.status == CatStatus.loading) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ),
          );
        }
        var category = BlocProvider.of<CatCubit>(context).category['category'];
        items = ['Select Type'];
        for (int i = 0; i < category.length; i++) {
          items.add(category[i]['type']);
        }
        return Column(
          children: [
            CreateProductDropDownButton(
              text: 'Category Type : ',
              onChanged: (val) async {
                List l = (category
                    .where((element) => element['type'] == val)
                    .toList());
                setState(() {
                  value = val!;
                  valueSec = 'Select Type';
                  if(value != 'Select Type') {
                    cId = l[0]['id'];
                    widget.activeId.text = l[0]['id'].toString();
                    widget.funType.text = 'Category';
                  }
                  print(widget.activeId.text);
                });
                await BlocProvider.of<CatCubit>(context).getSec(cId,'desc');
              },
              items: items,
              value: value,
            ),
            value != 'Select Type'
                ? Builder(
                    builder: (context) {
                      return BlocBuilder<CatCubit, CatState>(
                        builder: (context, state) {
                          if (BlocProvider.of<CatCubit>(context).section == null) {
                            return const CircularProgressIndicator();
                          }
                          itemsSec.clear();
                          var sector = BlocProvider.of<CatCubit>(context)
                              .section;
                          List section = [];
                          itemsSec.add('Select Type');
                          if(sector.containsKey('section') && sector['section'] != 'result not found') {
                            section = BlocProvider.of<CatCubit>(context).section['section'];
                            for (int i = 0; i < section.length; i++) {
                              itemsSec.add(section[i]['Section_type']);
                            }
                          }
                          return CreateProductDropDownButton(text: 'Section name : ', onChanged: (val) async {
                            List l = (section
                                .where((element) =>
                            element['Section_type'] == val)
                                .toList());
                            print(l);
                            setState(() {
                              valueSec = val!;
                              valueSector = 'Select Type';
                              if (valueSec != 'Select Type') {
                                sId = l[0]['id'];
                                widget.activeId.text = l[0]['id'].toString();
                                widget.funType.text = 'Section';
                              }
                              else {
                                widget.activeId.text = cId.toString();
                                widget.funType.text = 'Category';
                              }
                            });
                            print(widget.activeId.text);
                            await BlocProvider.of<CatCubit>(context).getSector(sId, 'desc');
                          }, items: itemsSec, value: valueSec);
                        },
                      );
                    },
                  )
                : Container(),
            // value != 'Select Type'
            //     ? SizedBox(height: height * 0.02)
            //     : Container(),
            valueSec != 'Select Type'
                ? Builder(
              builder: (context) {
                return BlocBuilder<CatCubit, CatState>(
                  builder: (context, state) {
                    if (BlocProvider.of<CatCubit>(context).sectors == null) {
                      return const CircularProgressIndicator();
                    }
                    sectorName.clear();
                    sectorName.add('Select Type');
                    Map sector = BlocProvider.of<CatCubit>(context).sectors;
                    List section = [];
                    if(sector.containsKey('sector')) {
                      section = BlocProvider.of<CatCubit>(context).sectors['sector'];
                      for (int i = 0; i < section.length; i++) {
                        sectorName.add(section[i]['name']);
                      }
                    }
                    return CreateProductDropDownButton(text: 'Section name : ', onChanged: (val) async {
                      List l = (section
                          .where((element) {
                            return element['name'] == val;
                          })
                          .toList());
                      print(l.length);
                      setState(() {
                        valueSector = val!;
                        if (valueSector != 'Select Type') {
                          secId = l[0]['id'];
                          widget.activeId.text = l[0]['id'].toString();
                          widget.funType.text = 'Sector';
                        }
                        else {
                          widget.activeId.text = secId.toString();
                          widget.funType.text = 'Section';
                        }
                      });
                      print(widget.activeId.text);
                    }, items: sectorName, value: valueSector);
                  },
                );
              },
            )
                : Container(),
            valueSec != 'Select Type'
                ? SizedBox(height: height * 0.02)
                : Container(),
          ],
        );
      },
    );
  }
}
