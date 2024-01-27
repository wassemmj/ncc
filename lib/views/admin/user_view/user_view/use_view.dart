import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';

import '../../../../core/color1.dart';
import '../../../../core/style.dart';
import '../../../../logic/user_cubit/user_cubit.dart';
import '../../../nav_view/widget/appbar_icon.dart';

class UseView extends StatefulWidget {
  const UseView({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  State<UseView> createState() => _UseViewState();
}

class _UseViewState extends State<UseView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<UserCubit>(context).findUser(widget.userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            padding: EdgeInsets.all((height / 108)),
            child: AppbarIcon(
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.of(context).pop();
                }, color: Colors.black54.withOpacity(0.03),)),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(height * 0.02),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state.status == UserStatus.loading) {
                return const LoadingWidget();
              }
              if (BlocProvider.of<UserCubit>(context).user == null) {
                return const LoadingWidget();
              }
              var users = BlocProvider.of<UserCubit>(context).user['user'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.15),
                  Text(
                    'User ${widget.userId}',
                    style: Style.textStyle23,
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    children: [
                      Text('Email :  ',style: TextStyle(color: Color1.primaryColor,fontWeight: FontWeight.w500,fontSize: 20),),
                      SizedBox(
                        width: width / 2.2,
                        child: Text(
                          users['email'],
                          style: const TextStyle(
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Text('Name :  ',style: TextStyle(color: Color1.primaryColor,fontWeight: FontWeight.w500,fontSize: 20),),
                      Text(
                        users['name'],
                        style: Style.textStyle18,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Text('Role :  ',style: TextStyle(color: Color1.primaryColor,fontWeight: FontWeight.w500,fontSize: 20),),
                      Text(
                        users['role'] == 1 ? 'Admin' : 'User',
                        style: Style.textStyle17,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<UserCubit,UserState> (
        builder: (context, state) {
          return FloatingActionButton(
            tooltip: 'Make User Admin',
            onPressed: () async {
              await BlocProvider.of<UserCubit>(context).makeAdmin(widget.userId);
            },
            backgroundColor: Color1.primaryColor,
            foregroundColor: Color1.white,
            child: const Icon(Icons.admin_panel_settings_outlined,size: 20,),
          );
        },
      ),
    );
  }
}
