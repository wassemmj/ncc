import 'package:flutter/material.dart';

import 'home_product.dart';

class HomeListProduct extends StatelessWidget {
  const HomeListProduct({Key? key, required this.product}) : super(key: key);

  final Map product;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List productsData = product['data'];
    int pageCount = product['last_page'];
    List pageUrl = product['links'];
    int total = product['total'];
    return Container(
      constraints:
          BoxConstraints(maxHeight: height * 0.29, minHeight: height * 0.27),
      child: ListView.builder(
        itemCount: productsData.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return HomeProduct(
            name: productsData[index]['name'],
            image: productsData[index]['image'],
            brand: productsData[index]['Brand'],
            price: productsData[index]['final_price'],
            id: productsData[index]['id'],
            discount: productsData[index].containsKey('discount_id'),
            percentageOff: productsData[index].containsKey('discount_id')
                ? productsData[index]['percentage_off']
                : 0,
          );
        },
      ),
    );
  }
}
