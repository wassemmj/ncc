import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ncc_app/views/home_view/widget/advert_nav.dart';

import '../../../core/api.dart';
import '../../../core/color1.dart';

class HomeAdvert extends StatelessWidget {
  const HomeAdvert({Key? key, required this.adv,})
      : super(key: key);

  final List adv;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> c = adv.map((e) => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: width > 300 ?  width - width * 0.12 : width * 0.67,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '${Api.apiImage}/adv/${e['image']}',
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdvertNav(type: e['type']),));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
                  backgroundColor:
                  MaterialStateProperty.all(Color1.primaryColor),
                ),
                child: const Text(
                  'Shop now' ,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        // SizedBox(width: (width/41))
      ],
    )).toList();
    return CarouselSlider(
      items: c,
      options: CarouselOptions(
        height: (height / 17.34 * 3),
        aspectRatio: width / height,
        viewportFraction: height / width / 2,
        initialPage: 0,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(seconds: 5),
      ),
    );
  }
}
