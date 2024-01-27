import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/products_view/widget/product_widget.dart';

import '../../../core/color1.dart';
import '../../../logic/cat_cubit/cat_cubit.dart';
import '../../admin/products_admin_view/widget/product_empty.dart';
import '../../admin/products_admin_view/widget/product_page_count.dart';

class ProductOut extends StatefulWidget {
  const ProductOut({Key? key, required this.pageIndex, required this.onPressed, required this.product}) : super(key: key);

  final int pageIndex;
  final Function(int index) onPressed;
  final Map product;

  @override
  State<ProductOut> createState() => _ProductOutState();
}

class _ProductOutState extends State<ProductOut> {
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
          var products;
          if (widget.pageIndex == 0) {
            products = widget.product['products'];
          } else {
            products = BlocProvider.of<CatCubit>(context).product['products'];
          }
          List productsData = products['data'];
          int pageCount = products['last_page'];
          List pageUrl = products['links'];
          int total = products['total'];
          return Container(
            padding: EdgeInsets.all((height * 0.02)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                total != 0 ? GridView.extent(
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
                    percentageOff: e.containsKey('discount_id') ? e['percentage_off'] : 0,
                  ))
                      .toList(),
                ) : Container(),
                pageCount != 1
                    ? ProductPageCount(pageCount: pageCount, pageIndex: widget.pageIndex, onPressed: widget.onPressed)
                    : Container(),
                SizedBox(height: pageCount != 1 ? height * 0.03 : 0),
              ],
            ),
          );
        },
      ),
    );
  }
}
