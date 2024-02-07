import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/color1.dart';
import '../../../logic/home_cubit/home_cubit.dart';
import '../../admin/products_admin_view/widget/product_page_count.dart';
import '../../nav_view/widget/appbar_icon.dart';
import '../../products_view/widget/product_widget.dart';

class ShowMoreView extends StatefulWidget {
  const ShowMoreView({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  State<ShowMoreView> createState() => _ShowMoreViewState();
}

class _ShowMoreViewState extends State<ShowMoreView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.type == 'new') {
        await BlocProvider.of<HomeCubit>(context, listen: false)
            .getNewProduct('desc');
      } else if (widget.type == 'used') {
        await BlocProvider.of<HomeCubit>(context, listen: false)
            .getUsedProduct('desc');
      } else {
        await BlocProvider.of<HomeCubit>(context, listen: false)
            .getDiscountProduct('desc');
      }
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
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.status == HomeStatus.loading ||
                  state.status == HomeStatus.initial) {
                return Container(
                  alignment: Alignment.center,
                  height: height,
                  child: CircularProgressIndicator(
                    color: Color1.primaryColor,
                    strokeWidth: 1,
                  ),
                );
              }
              var products;
              if (widget.type == 'new') {
                if (BlocProvider.of<HomeCubit>(context).newProduct == null) {
                  return Container(
                    alignment: Alignment.center,
                    height: height,
                    child: CircularProgressIndicator(
                      color: Color1.primaryColor,
                      strokeWidth: 1,
                    ),
                  );
                }
                products =
                    BlocProvider.of<HomeCubit>(context).newProduct['products'];
              } else if (widget.type == 'used') {
                if (BlocProvider.of<HomeCubit>(context).usedProduct == null) {
                  return Container(
                    alignment: Alignment.center,
                    height: height,
                    child: CircularProgressIndicator(
                      color: Color1.primaryColor,
                      strokeWidth: 1,
                    ),
                  );
                }
                products =
                    BlocProvider.of<HomeCubit>(context).usedProduct['products'];
              } else {
                if (BlocProvider.of<HomeCubit>(context).discountProduct ==
                    null) {
                  return Container(
                    alignment: Alignment.center,
                    height: height,
                    child: CircularProgressIndicator(
                      color: Color1.primaryColor,
                      strokeWidth: 1,
                    ),
                  );
                }
                products = BlocProvider.of<HomeCubit>(context)
                    .discountProduct['products'];
              }
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
                        ? Container(
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
                                  pageIndex = 0;
                                });
                                if (widget.type == 'new') {
                                  await BlocProvider.of<HomeCubit>(context)
                                      .getNewProduct(items[items1.indexOf(values!)]);
                                } else if (widget.type == 'used') {
                                  await BlocProvider.of<HomeCubit>(context)
                                      .getUsedProduct(items[items1.indexOf(values!)]);
                                } else {
                                  await BlocProvider.of<HomeCubit>(context)
                                      .getDiscountProduct(items[items1.indexOf(values!)]);
                                }
                              },
                              iconEnabledColor: Color1.primaryColor,
                            ),
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
                              await BlocProvider.of<HomeCubit>(context)
                                  .api(pageUrl[index + 1]['url'], widget.type);
                            })
                        : Container(),
                    SizedBox(height: pageCount != 1 ? height * 0.02 : 0),
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
