import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/create_section/create_section.dart';
import 'package:ncc_app/views/admin/products_admin_view/widget/product_admin_out.dart';
import 'package:ncc_app/views/admin/section_admin_view/widget/section_admin_widget.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../../logic/cat_cubit/cat_cubit.dart';
import '../../nav_view/widget/appbar_icon.dart';

class SectionAdminView extends StatefulWidget {
  const SectionAdminView({Key? key, required this.catId, required this.catName})
      : super(key: key);

  final int catId;
  final String catName;

  @override
  State<SectionAdminView> createState() => _SectionAdminViewState();
}

class _SectionAdminViewState extends State<SectionAdminView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<CatCubit>(context).getSec(widget.catId,'desc');
    });
    super.initState();
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
            padding: EdgeInsets.all((height / 108)),
            child: AppbarIcon(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.black54.withOpacity(0.03),
            )),
        title: Text(
          widget.catName,
          style: Style.textStyle23,
        ),
        actions: [
          AppbarIcon(
            icon: Icons.add,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateSection(),
              ));
            },
            color: Colors.black54.withOpacity(0.03),
          ),
          SizedBox(width: (width / 82)),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            if (state.status == CatStatus.loading ||
                state.status == CatStatus.initial) {
              return const LoadingWidget();
            }
            if (BlocProvider.of<CatCubit>(context).section == null) {
              return const LoadingWidget();
            }
            Map sectionM = BlocProvider.of<CatCubit>(context).section;
            var section;
            if(sectionM['section'] == 'result not found') {
              return Container();
            }
            if (sectionM.containsKey('section')) {
              section = BlocProvider.of<CatCubit>(context).section['section'];
              return ListView.builder(
                itemCount: section.length,
                physics: const RangeMaintainingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SectionAdminWidget(
                    id: section[index]['id'],
                    name: section[index]['Section_type'],
                    image: section[index]['Section_image'],
                  );
                },
              );
            } else {
              var pageUrl = sectionM['products']['links'];
              return ProductsAdminOut(
                      pageIndex: pageIndex,
                      product: sectionM,
                      onPressed: (index) async {
                        setState(() {
                          pageIndex = index;
                        });
                        await BlocProvider.of<CatCubit>(context)
                            .api(pageUrl[index + 1]['url']);
                      },
                    );
            }
          },
        ),
      ),
    );
  }
}
