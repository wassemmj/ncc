import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/auth_view/login_view.dart';
import 'package:ncc_app/views/fav_view/fav_view.dart';

import '../../core/color1.dart';
import '../../logic/auth_cubit/auth_cubit.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      String title, IconData icon, Function() function, BuildContext ctx) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
        color: Color1.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Color1.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).colorScheme.primary,
              child: const Text(
                'Napoli Trading Company',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color1.white,
                ),
              ),
            ),
            buildListTile(
              'Favorites',
              Icons.favorite_border,
              () { Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  FavView(),
              ));},
              context,
            ),
            buildListTile(
              'Settings',
              Icons.settings,
              () {},
              context,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.status == AuthStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('log out Successfully')));
                }
              },
              builder: (context, state) {
                return buildListTile(
                  'Log out',
                  Icons.logout_outlined,
                  () async {
                    await BlocProvider.of<AuthCubit>(context).logout();
                    if (state.status == AuthStatus.success) {

                    }
                  },
                  context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
