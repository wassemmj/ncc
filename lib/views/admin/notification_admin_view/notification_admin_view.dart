import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/color1.dart';
import '../../../logic/notification_cubit/notification_cubit.dart';
import '../../awidget/loading_widget.dart';
import '../../nav_view/widget/appbar_icon.dart';

class NotificationAdminView extends StatefulWidget {
  const NotificationAdminView({Key? key}) : super(key: key);

  @override
  State<NotificationAdminView> createState() => _NotificationAdminViewState();
}

class _NotificationAdminViewState extends State<NotificationAdminView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<NotificationCubit>(context, listen: false)
          .getNotification();
    });
    super.initState();
  }

  String? read = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            padding: EdgeInsets.all((height / 108)),
            child: AppbarIcon(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.black54.withOpacity(0.03),
            )),
      ),
      body: SafeArea(
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (BlocProvider.of<NotificationCubit>(context).notification ==
                null) {
              return const LoadingWidget();
            }
            var m = BlocProvider.of<NotificationCubit>(context)
                .notification["notifications"];
            return Container(
              padding: EdgeInsets.all(height * 0.02),
              child: ListView.builder(
                itemCount: m.length,
                itemBuilder: (context, index) {
                  read = m[index]['read_at'];
                  var data = m[index]['data'];
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      key: const ValueKey(0),
                      children: [
                        BlocListener<NotificationCubit, NotificationState>(
                          listener: (context, state) {
                            if (state.status == NotificationStatus.success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('deleted successfully')));
                            }
                          },
                          child: SlidableAction(
                            key: const ValueKey(0),
                            onPressed: (context) async {
                              await BlocProvider.of<NotificationCubit>(context)
                                  .deleteNotification(m[index]['id']);
                            },
                            backgroundColor: Color1.white,
                            foregroundColor: const Color(0xFFFE4A49),
                            icon: Icons.delete,
                          ),
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () async {
                        await BlocProvider.of<NotificationCubit>(context).markAsRead(m[index]['id']);
                      },
                      style: ListTileStyle.list,
                      shape: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black54.withOpacity(0.05))),
                      title: Text(
                        data['message'],
                        style: const TextStyle(
                            color: Color1.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      subtitle: Text(
                        data['shipping_address'],
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      leading: Text(
                        data['order_id'].toString(),
                        style: TextStyle(
                            color: Color1.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: read == null
                          ? Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: Color1.primaryColor,
                                  shape: BoxShape.circle),
                            )
                          : Container(width: 0,height: 0,),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
