import 'package:flutter/material.dart';

import '../../../core/color1.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key, required this.set, required this.currentIndex, required this.category}) : super(key: key);

  final Function(int index) set;
  final List category;
  final int currentIndex;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return  Container(
      padding: EdgeInsets.only(left: height / 80),
      height: height * 0.0565,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.category.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => widget.set(index),
            child: Container(
              padding: EdgeInsets.only(top: height / 57.82 ,right: height / 80*2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category[index]['type'],
                    style: TextStyle(
                        color: index==widget.currentIndex ? Colors.black: Colors.black54,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  Container(
                    width: height / 43*2,
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: index==widget.currentIndex ? Color1.primaryColor : Colors.transparent,
                              width: 3,
                              style: BorderStyle.solid
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
