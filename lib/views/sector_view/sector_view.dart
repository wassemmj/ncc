import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/sector_view/widget/sector_widget.dart';

import '../../core/color1.dart';
import '../../core/style.dart';
import '../../logic/cat_cubit/cat_cubit.dart';
import '../admin/products_admin_view/widget/product_page_count.dart';
import '../nav_view/widget/appbar_icon.dart';
import '../products_view/widget/product_out.dart';

class SectorView extends StatefulWidget {
  const SectorView({Key? key, required this.secId, required this.sectionName}) : super(key: key);

  final int secId;
  final String sectionName;

  @override
  State<SectorView> createState() => _SectorViewState();
}

class _SectorViewState extends State<SectorView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<CatCubit>(context,listen: false).getSector(widget.secId, 'desc');
    });
    super.initState();
  }

  int pageIndex = 0;

  String? value = 'Z -> A';
  List<String> items = [
    'desc',
    'asc',
    'Hprice',
    'Lprice',
  ];

  List<String> items1 = [
    'Z -> A',
    'A -> Z',
    'Height Price',
    'Low Price',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.sectionName,
          style: Style.textStyle23,
        ),
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
          child: BlocBuilder<CatCubit, CatState>(
            builder: (context, state) {
              if (state.status == CatStatus.loading ||
                  state.status == CatStatus.initial) {
                return Container(
                  alignment: Alignment.center,
                  height: height,
                  child: CircularProgressIndicator(
                    color: Color1.primaryColor,
                    strokeWidth: 1,
                  ),
                );
              }
              if (BlocProvider.of<CatCubit>(context).sectors == null) {
                return Container(
                  alignment: Alignment.center,
                  height: height,
                  child: CircularProgressIndicator(
                    color: Color1.primaryColor,
                    strokeWidth: 1,
                  ),
                );
              }
              Map sector = BlocProvider.of<CatCubit>(context).sectors;
              if (sector.containsKey('sector')) {
                var sectors =
                    BlocProvider.of<CatCubit>(context).sectors['sector'];
                return SectorWidget(sectors: sectors);
              }
              var pageUrl = sector['products']['links'];
              int pageCount = sector['products']['last_page'];
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: width * 0.05),
                    height: height * 0.045,
                    alignment: Alignment.topRight,
                    child: DropdownButton(
                      items: items1.map((String items) {
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
                        await BlocProvider.of<CatCubit>(context).getSector(widget.secId, items[items1.indexOf(values!)]);
                      },
                      iconEnabledColor: Color1.primaryColor,
                    ),
                  ),
                  ProductOut(pageIndex: pageIndex, product: sector, onPressed: (index) async {
                    setState(() {
                      pageIndex = index;
                    });
                    print(pageUrl[index + 1]['url']);
                    sector =  await BlocProvider.of<CatCubit>(context)
                        .api(pageUrl[index + 1]['url']);
                  },),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
