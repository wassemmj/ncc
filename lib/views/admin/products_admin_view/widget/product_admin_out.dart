import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/products_admin_view/widget/product_admin_widget.dart';
import 'package:ncc_app/views/admin/products_admin_view/widget/product_page_count.dart';

import '../../../../core/color1.dart';
import '../../../../logic/cat_cubit/cat_cubit.dart';

class ProductsAdminOut extends StatelessWidget {
  const ProductsAdminOut({Key? key, required this.pageIndex, required this.product, required this.onPressed}) : super(key: key);

  final int pageIndex;
  final Function(int index) onPressed;
  final Map product;

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
          if (pageIndex == 0) {
            products = product['products'];
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
              children: [
                GridView.extent(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  maxCrossAxisExtent: height * 0.4,
                  childAspectRatio: width / height * 1.2,
                  children: productsData
                      .map((e) => ProductAdminWidget(
                    name: e['name'],
                    image: e['image'],
                    brand: e['Brand'],
                    price: e['final_price'],
                    productId: e['id'], discountId: e['discount_id'] ?? 0,
                  ))
                      .toList(),
                ),
                pageCount != 1
                    ? ProductPageCount(pageCount: pageCount, pageIndex: pageIndex, onPressed: onPressed)
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
