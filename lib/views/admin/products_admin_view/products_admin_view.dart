import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/create_product/create_product.dart';
import 'package:ncc_app/views/admin/products_admin_view/widget/product_admin_widget.dart';
import 'package:ncc_app/views/admin/products_admin_view/widget/product_empty.dart';
import 'package:ncc_app/views/admin/products_admin_view/widget/product_page_count.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../../logic/cat_cubit/cat_cubit.dart';
import '../../nav_view/widget/appbar_icon.dart';

class ProductsAdminView extends StatefulWidget {
  const ProductsAdminView(
      {Key? key, required this.name, required this.sectorID})
      : super(key: key);

  final String name;
  final int sectorID;

  @override
  State<ProductsAdminView> createState() => _ProductsAdminViewState();
}

class _ProductsAdminViewState extends State<ProductsAdminView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<CatCubit>(context)
          .getProduct(widget.sectorID, 'desc');
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
            icon: Icons.add,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateProduct(),
              ));
            },
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
                      Text(
                        widget.name,
                        style: Style.textStyleSec,
                      ),
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
                            .map((e) => ProductAdminWidget(
                                  productId: e['id'],
                                  name: e['name'],
                                  image: e['image'],
                                  brand: e['Brand'],
                                  price: e['final_price'],
                                  discountId: e.containsKey('discount_id') ? e['discount_id'] : 0,
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
