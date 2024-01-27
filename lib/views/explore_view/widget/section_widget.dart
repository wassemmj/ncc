import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/products_admin_view/widget/product_empty.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';
import 'package:ncc_app/views/explore_view/widget/section.dart';

import '../../../core/color1.dart';
import '../../../logic/cat_cubit/cat_cubit.dart';
import '../../products_view/widget/product_out.dart';

class SectionWidget extends StatefulWidget {
  const SectionWidget({Key? key, required this.catId}) : super(key: key);

  final int catId;

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<CatCubit>(context,listen: false).getSec(widget.catId,'desc');
    });
    super.initState();
  }

  int pageIndex = 0;

  String? value = 'desc';
  List<String> items = [
    'desc',
    'asc',
    'Hprice',
    'Lprice',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        if (state.status == CatStatus.loading ||
            state.status == CatStatus.initial) {
          return const LoadingWidget();
        }
        if (BlocProvider.of<CatCubit>(context).section == null) {
          return const LoadingWidget();
        }
        var sectionM = BlocProvider.of<CatCubit>(context).section;
        var section;
        if(BlocProvider.of<CatCubit>(context).section['section'] == 'result not found') {
          return const ProductEmpty();
        }
        else if (sectionM.containsKey('section')) {
          section = BlocProvider.of<CatCubit>(context).section['section'];
          return Container(
            padding: EdgeInsets.all(height * 0.03),
            child: GridView.builder(
              itemCount: section.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: height * 0.02,
                mainAxisSpacing: height * 0.02,
              ),
              itemBuilder: (context, index) {
                return Section(id: section[index]['id'], name: section[index]['Section_type'], image: section[index]['Section_image'],);
              },
            ),
          );
        } else {
          var pageUrl = sectionM['products']['links'];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(right: width * 0.05),
                height: height * 0.045,
                alignment: Alignment.topRight,
                child: DropdownButton(
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  value: value,
                  onChanged: (values) async {
                    setState(() {
                      value = values;
                    });
                    await BlocProvider.of<CatCubit>(context).getSec(widget.catId,values!);
                  },
                  iconEnabledColor: Color1.primaryColor,
                ),
              ),
              ProductOut(pageIndex: pageIndex, product: sectionM, onPressed: (index) async {
                setState(() {
                  pageIndex = index;
                });
                await BlocProvider.of<CatCubit>(context)
                    .api(pageUrl[index + 1]['url']);
              },),
            ],
          );
        }
      },
    );
  }
}
