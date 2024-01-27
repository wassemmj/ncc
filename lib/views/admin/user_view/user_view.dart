import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/user_cubit/user_cubit.dart';
import 'package:ncc_app/views/admin/user_view/widget/user_widget.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../nav_view/widget/appbar_icon.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<UserCubit>(context).getAllUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
            padding: EdgeInsets.all((height / 108)),
            child: AppbarIcon(
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.of(context).pop();
                }, color: Colors.black54.withOpacity(0.03),)),
        title: Text(
          'All User',
          style: Style.textStyle23,
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if(state.status == UserStatus.loading) {
            return const LoadingWidget();
          }
          if(BlocProvider.of<UserCubit>(context).users == null) {
            return const LoadingWidget();
          }
          var users = BlocProvider.of<UserCubit>(context).users['users'];
          return SafeArea(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserWidget(email: users[index]['email'], name: users[index]['name'], role: users[index]['role'], userId: users[index]['id'],);
              },
            ),
          );
        },
      ),
    );
  }
}
