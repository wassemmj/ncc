import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/awidget/order_alert.dart';
import 'package:ncc_app/views/admin/home_admin_view/home_admin_view.dart';
import 'package:ncc_app/views/admin/notification_admin_view/notification_admin_view.dart';
import 'package:ncc_app/views/admin/order_admin_view/order_admin_view.dart';
import 'package:ncc_app/views/admin/settings_admin/settings_admin.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../../logic/fav_cubit/fav_cubit.dart';
import '../../../logic/notification_cubit/notification_cubit.dart';
import '../../explore_view/explore_view.dart';
import '../../nav_view/widget/appbar_icon.dart';
import '../../search_delegate/search_delegate.dart';

class NavAdminView extends StatefulWidget {
  const NavAdminView({Key? key}) : super(key: key);

  @override
  State<NavAdminView> createState() => _NavAdminViewState();
}

class _NavAdminViewState extends State<NavAdminView> {
  var _currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<NotificationCubit>(context, listen: false)
          .getNotification();
      await BlocProvider.of<FavCubit>(context, listen: false).getFav();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List bottomView = [
      {
        'body': const HomeAdminView(),
      },
      {
        'body': const ExploreView(),
      },
      {
        'AppBar' : AppBar(
          centerTitle: true,
          title: Text(
            'Orders',
            style: Style.textStyle23,
          ),
          actions: [
            AppbarIcon(
              icon: Icons.details,
              onPressed: () {
                showDialog(context: context, builder: (context) => const OrderAlert(),);
              },
              color: Colors.black54.withOpacity(0.03),
            ),
            SizedBox(width: (width / 41)),
          ],
        ),
        'body': const OrderAdminView(),
      },
      {
        'body': const SettingsAdmin(),
      },
    ];
    return Scaffold(
      appBar: _currentIndex == 2 ? bottomView[_currentIndex]['AppBar']: AppBar(
        centerTitle: true,
        title: Text(
          'Napoli',
          style: Style.textStyle23,
        ),
        actions: [
          AppbarIcon(
            icon: Icons.search_outlined,
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            color: Colors.black54.withOpacity(0.03),
          ),
          SizedBox(width: (width / 82)),
          AppbarIcon(
            icon: Icons.notifications_none_outlined,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationAdminView(),
              ));
            },
            color: Colors.black54.withOpacity(0.03),
          ),
          SizedBox(width: (width / 41)),
        ],
      ),
      body: bottomView[_currentIndex]['body'],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
        },
        itemPadding: EdgeInsets.all((height / 57.82)),
        selectedItemColor: Color1.black,
        unselectedItemColor: Colors.black54,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.category_outlined),
            title: const Text('Explore'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_basket_outlined),
            title: const Text("Order"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text("Settings"),
          ),
        ],
      ),
    );
  }
}
