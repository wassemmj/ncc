import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncc_app/core/style.dart';
import 'package:ncc_app/logic/fav_cubit/fav_cubit.dart';
import 'package:ncc_app/views/admin/notification_admin_view/notification_admin_view.dart';
import 'package:ncc_app/views/cart_view/cart_view.dart';
import 'package:ncc_app/views/contact_us_view/contact_us_view.dart';
import 'package:ncc_app/views/explore_view/explore_view.dart';
import 'package:ncc_app/views/fav_view/fav_view.dart';
import 'package:ncc_app/views/home_view/home_view.dart';
import 'package:ncc_app/views/nav_view/widget/appbar_icon.dart';
import 'package:ncc_app/views/profile_view/profile_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../core/color1.dart';
import '../../logic/auth_cubit/auth_cubit.dart';
import '../../logic/notification_cubit/notification_cubit.dart';
import '../auth_view/login_view.dart';
import '../search_delegate/search_delegate.dart';

class NavView extends StatefulWidget {
  const NavView({Key? key}) : super(key: key);

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  var _currentIndex = 0;

  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

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
        'body': const HomeView(),
      },
      {
        'body': const ExploreView(),
      },
      {
        'appbar': AppBar(
          centerTitle: true,
          title: Text(
            'My cart' ,
            style: Style.textStyle23,
          ),
          actions: [
            AppbarIcon(
              icon: Icons.car_crash_outlined,
              onPressed: () {},
              color: Colors.black54.withOpacity(0.03),
            ),
            SizedBox(width: (width / 82)),
          ],
        ),
        'body': const CartView(),
      },
      {
        'body': const Profile_View(),
      },
    ];
    return SideMenu(
      key: _endSideMenuKey,
      inverse: false,
      background: Color1.white,
      type: SideMenuType.slideNRotate,
      closeIcon: const Icon(
        Icons.close,
        color: Color1.black,
      ),
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: buildMenu(),
      ),
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: SideMenu(
        key: _sideMenuKey,
        menu: buildMenu(),
        type: SideMenuType.slideNRotate,
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: IgnorePointer(
          ignoring: isOpened,
          child: Scaffold(
            appBar: _currentIndex == 2
                ? bottomView[_currentIndex]['appbar']
                : AppBar(
                    leading: Container(
                      padding: EdgeInsets.all((height / 108)),
                      child: Builder(
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.03),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                // Scaffold.of(context).openDrawer();
                                toggleMenu(true);
                              },
                              tooltip: MaterialLocalizations.of(context)
                                  .openAppDrawerTooltip,
                              icon: Icon(
                                Icons.menu,
                                color: Colors.black,
                                size: (height / 39.42),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    centerTitle: true,
                    title: Text(
                      'Napoli' ,
                      style: Style.textStyle23,
                    ),
                    actions: [
                      AppbarIcon(
                        icon: Icons.search_outlined,
                        onPressed: () {
                          showSearch(
                              context: context, delegate: MySearchDelegate());
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
                  icon: const Icon(Icons.shopping_cart_outlined),
                  title: const Text("Cart"),
                ),
                // SalomonBottomBarItem(
                //   icon: const Icon(Icons.favorite_border),
                //   title: const Text("Favorite"),
                // ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person_2_outlined),
                  title: const Text("Profile"),
                ),
              ],
            ),
            // drawer: _currentIndex==2 ? null : const MainDrawer(),
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                  child: Image.asset('image/logo.jpg'),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Napoli Trading Company',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color1.black,
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              toggleMenu(true);
            },
            leading: const Icon(Icons.home, size: 20.0, color: Colors.black),
            title: const Text("Home"),
            textColor: Colors.black,
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => FavView()));
            },
            leading: const Icon(Icons.favorite_border,
                size: 20.0, color: Colors.black),
            title: const Text("Favorites" ),
            textColor: Color1.black,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ContactUsView(),
              ));
            },
            leading:
                const Icon(FontAwesomeIcons.a, size: 20.0, color: Colors.black),
            title: const Text("About US"),
            textColor: Colors.black,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('log out Successfully')));
              }
            },
            builder: (context, state) {
              return ListTile(
                onTap: () async {
                  await BlocProvider.of<AuthCubit>(context).logout();
                  if (state.status == AuthStatus.success) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ));
                  }
                },
                leading: const Icon(Icons.logout_rounded,
                    size: 20.0, color: Colors.black),
                title: const Text("log out"),
                textColor: Colors.black,
                dense: true,

                // padding: EdgeInsets.zero,
              );
            },
          ),
        ],
      ),
    );
  }
}
