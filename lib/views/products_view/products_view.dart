import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/core/style.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';
import 'package:ncc_app/views/nav_view/widget/appbar_icon.dart';
import 'package:ncc_app/views/products_view/widget/product_widget.dart';

import '../../core/color1.dart';
import '../../logic/cat_cubit/cat_cubit.dart';
import '../admin/products_admin_view/widget/product_empty.dart';
import '../admin/products_admin_view/widget/product_page_count.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key, required this.name, required this.sectorId})
      : super(key: key);

  final String name;
  final int sectorId;

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<CatCubit>(context)
          .getProduct(widget.sectorId, 'desc');
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
        leading: Container(
          padding: EdgeInsets.all((height / 108)),
          child: AppbarIcon(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.black54.withOpacity(0.03),
          ),
        ),
        actions: [
          AppbarIcon(
            icon: Icons.more_horiz_outlined,
            onPressed: () {},
            color: Colors.black54.withOpacity(0.03),
          ),
          SizedBox(width: (width / 41)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<CatCubit, CatState>(
            builder: (context, state) {
              if (state.status == CatStatus.loading ||
                  state.status == CatStatus.initial) {
                return const LoadingWidget();
              }
              if (BlocProvider.of<CatCubit>(context).product == null) {
                return const LoadingWidget();
              }
              if (BlocProvider.of<CatCubit>(context)
                  .product
                  .containsKey('products')) {
                var products =
                    BlocProvider.of<CatCubit>(context).product['products'];
                List productsData = products['data'];
                int pageCount = products['last_page'];
                List pageUrl = products['links'];
                int total = products['total'];
                return Container(
                  padding: EdgeInsets.all((height * 0.02)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      total != 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.name,
                                  style: Style.textStyleSec,
                                ),
                                Container(
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
                                      await BlocProvider.of<CatCubit>(context)
                                          .getProduct(widget.sectorId, items[items1.indexOf(values!)]);
                                    },
                                    iconEnabledColor: Color1.primaryColor,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      GridView.extent(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        maxCrossAxisExtent: height * 0.4,
                        childAspectRatio: width / height * 1.2,
                        children: productsData
                            .map((e) => ProductWidget(
                                  name: e['name'],
                                  image: e['image'],
                                  brand: e['Brand'],
                                  price: e['final_price'],
                                  id: e['id'],
                                  discount: e.containsKey('discount_id'),
                                  percentageOff: e.containsKey('discount_id')
                                      ? e['percentage_off']
                                      : 0,
                                ))
                            .toList(),
                      ),
                      pageCount != 1
                          ? ProductPageCount(
                              pageCount: pageCount,
                              pageIndex: pageIndex,
                              onPressed: (index) async {
                                setState(() {
                                  pageIndex = index;
                                });
                                await BlocProvider.of<CatCubit>(context)
                                    .api(pageUrl[index + 1]['url']);
                              })
                          : Container(),
                      SizedBox(height: pageCount != 1 ? height * 0.02 : 0),
                    ],
                  ),
                );
              } else {
                return const ProductEmpty();
              }
            },
          ),
        ),
      ),
    );
  }
}
