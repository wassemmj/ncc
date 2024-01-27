import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncc_app/views/account_view/account_view.dart';
import 'package:ncc_app/views/all_order_view/all_order_view.dart';
import 'package:ncc_app/views/profile_view/widget/profile_tile.dart';

import '../../../core/color1.dart';

class Profile_Nav extends StatelessWidget {
  const Profile_Nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: height * 0.02),
            child: const Text(
              'My Account',
              style: TextStyle(
                color: Color1.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const AccountView(),
          // InkWell(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AccountView(),)),child: const ProfileTile(iconData: Icons.person, text: 'Account')),
          SizedBox(height: height * 0.02),
          InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AllOrderView(),
                  )),
              child: const ProfileTile(
                  iconData: FontAwesomeIcons.cartPlus, text: 'My All Order')),
          SizedBox(height: height * 0.02),
          // Container(
          //   decoration: const BoxDecoration(
          //       color: Color1.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey,
          //           offset: Offset(0.0, 1.0), //(x,y)
          //           blurRadius: 6.0,
          //         ),
          //       ],
          //       borderRadius:  BorderRadius.only(bottomRight: Radius.circular(50))
          //   ),
          //   padding: EdgeInsets.all(height * 0.02),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Text(
          //         'My Orders',
          //         style: TextStyle(
          //           color: Color1.black,
          //           fontSize: 20,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       SizedBox(height: height * 0.02),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: const [
          //           OrderButton(iconData: Icons.done, text: 'Accepted', color: Colors.green,),
          //           OrderButton(iconData: FontAwesomeIcons.x, text: 'rejected', color: Colors.red,),
          //           OrderButton(iconData: Icons.access_time_outlined, text: 'Pending', color: Color1.black,),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
