import 'package:flutter/material.dart';

import '../../../../core/color1.dart';

class ProductPageCount extends StatelessWidget {
  const ProductPageCount({Key? key, required this.pageCount, required this.pageIndex, required this.onPressed}) : super(key: key);

  final int pageCount;
  final int pageIndex;
  final Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.042,
      child: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: pageCount,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => onPressed(index),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.symmetric(
                    horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color1.primaryColor),
                  color: pageIndex == index
                      ? Color1.primaryColor
                      : Color1.white,
                ),
                child: Text(
                  '${index + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: pageIndex == index
                          ? Color1.white
                          : Color1.primaryColor,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
