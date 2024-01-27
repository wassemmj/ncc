import 'package:flutter/material.dart';
import 'package:ncc_app/views/details_view/details_view.dart';

import '../../../core/api.dart';
import '../../../core/style.dart';
import '../../awidget/fav_button.dart';

class FavWidget extends StatelessWidget {
  const FavWidget({Key? key, required this.image, required this.name, required this.price, required this.id, required this.brand}) : super(key: key);

  final String image;
  final String name;
  final String brand;
  final String price;
  final int id;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsView(productId: id),));
      },
      child: Container(
        height: height * 0.176,
        margin: EdgeInsets.all(height * 0.022),
        decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black54, width: 0.2),
            )),
        child: Row(
          children: [
            Container(
              width: width * 0.3,
              height: height * 0.12,
              decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.04),
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(
                    '${Api.apiImage}/images/$image',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width / 2.2,
                  child: Text(
                    name,
                    style: const TextStyle(
                        letterSpacing: 0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: height * 0.01,),
                Text(
                  brand,
                  style: Style.textStyle14,
                ),
                Row(
                  children: [
                    Text(
                      '$price JOD',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    SizedBox(width: (width * 0.1)),
                    FavButton(id: id,),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
