import 'package:flutter/material.dart';
import 'package:ncc_app/core/api.dart';
import 'package:ncc_app/core/color1.dart';

import '../../../core/style.dart';
import '../../nav_view/widget/appbar_icon.dart';

class BuildImages extends StatefulWidget {
  const BuildImages({Key? key, required this.images, required this.type,})
      : super(key: key);

  final List images;
  final String type;

  @override
  State<BuildImages> createState() => _BuildImagesState();
}

class _BuildImagesState extends State<BuildImages> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: height * 0.02,left: height * 0.02,right: height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppbarIcon(icon: Icons.arrow_back, onPressed: () {Navigator.of(context).pop();}, color: Colors.white,),
                Text(
                  'Details Products',
                  style: Style.textStyle23,
                ),
                Text(
                  widget.type,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                ),

              ],
            ),
          ),
          Container(
            height: height * 0.26,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: currentIndex==0 ? NetworkImage('${Api.apiImage}/images/${widget.images[currentIndex]}') : NetworkImage('${Api.apiImage}/other_images/${widget.images[currentIndex]}'),
                  fit: BoxFit.contain,
                )
            ),
          ),
          SizedBox(
            height: height * 0.09,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: currentIndex == index
                            ? Color1.primaryColor
                            : Colors.white,
                        width: 3),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: index==0 ? Image.network('${Api.apiImage}/images/${widget.images[index]}')  : Image.network('${Api.apiImage}/other_images/${widget.images[index]}')),
                );
              },
            ),
          ),
          SizedBox(height: height * 0.01,),
        ],
      ),
    );
  }
}
