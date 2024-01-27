import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';

import '../../../core/color1.dart';
import '../../../logic/advert_cubit/advert_cubit.dart';
import '../../admin/products_admin_view/widget/product_page_count.dart';
import '../../nav_view/widget/appbar_icon.dart';
import '../../products_view/widget/product_widget.dart';

class AdvertNav extends StatefulWidget {
  const AdvertNav({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  State<AdvertNav> createState() => _AdvertNavState();
}

class _AdvertNavState extends State<AdvertNav> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.type == 'discount') {
        await BlocProvider.of<AdvertCubit>(context).getDiscountProduct('desc');
        print('1');
      } else if (widget.type == 'new') {
        await BlocProvider.of<AdvertCubit>(context).getNewProduct('desc');
        print('2');
      } else if (widget.type.length < 3) {
        await BlocProvider.of<AdvertCubit>(context).getSector(int.parse(widget.type), 'desc');
        print(int.parse(widget.type));
      } else {
        await BlocProvider.of<AdvertCubit>(context).search(widget.type);
      }
      // await BlocProvider.of<HomeCubit>(context)
      //     .getProduct(widget.sectorId, 'desc');
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
          child: BlocBuilder<AdvertCubit, AdvertState>(
            builder: (context, state) {
              if (state.status == AdvertStatus.loading ||
                  state.status == AdvertStatus.initial) {
                return const LoadingWidget();
              }
              if (BlocProvider.of<AdvertCubit>(context).products == null) {
                return const LoadingWidget();
              }
              if(BlocProvider.of<AdvertCubit>(context).products.containsKey('result')) {
                var products =
                BlocProvider.of<AdvertCubit>(context).products['result'];
                List productsData = products;
                return Container(
                  padding: EdgeInsets.all((height * 0.02)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                );
              }
              var products =
              BlocProvider.of<AdvertCubit>(context).products['products'];
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
                        ? widget.type != 'new' || widget.type != 'discount' || widget.type.length < 3 ? Container(
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
                              if (widget.type == 'discount') {
                                await BlocProvider.of<AdvertCubit>(context).getDiscountProduct(values!);
                              } else if (widget.type == 'new') {
                                await BlocProvider.of<AdvertCubit>(context).getNewProduct(values!);
                              } else if (widget.type.length < 3) {
                                await BlocProvider.of<AdvertCubit>(context).getSector(int.parse(widget.type), values!);
                              }
                              // await BlocProvider.of<CatCubit>(context)
                              //     .getProduct(widget.sectorId, values!);
                            },
                            iconEnabledColor: Color1.primaryColor,
                          ),
                        ) : Container()
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
                        brand: 'Asus Laptop',
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
                          await BlocProvider.of<AdvertCubit>(context)
                              .api(pageUrl[index + 1]['url'],widget.type);
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
