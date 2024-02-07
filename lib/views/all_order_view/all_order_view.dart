import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncc_app/views/all_order_view/widget/all_order_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/color1.dart';
import '../../core/style.dart';
import '../../logic/order_user_cubit/order_user_cubit.dart';
import '../admin/order_admin_view/widget/order_admin_widget.dart';
import '../awidget/loading_widget.dart';
import '../cart_view/widget/price_text.dart';
import '../nav_view/widget/appbar_icon.dart';

class AllOrderView extends StatefulWidget {
  const AllOrderView({Key? key}) : super(key: key);

  @override
  State<AllOrderView> createState() => _AllOrderViewState();
}

class _AllOrderViewState extends State<AllOrderView> {

  String? value = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<OrderUserCubit>(context).getLastOrder();
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
        child: SingleChildScrollView(
          child: BlocBuilder<OrderUserCubit, OrderUserState>(
            builder: (context, state) {
              if (state.status == OrderUserStatus.initial ||
                  state.status == OrderUserStatus.loading) {
                return const LoadingWidget();
              }
              if (BlocProvider.of<OrderUserCubit>(context).lastOrder ==
                  null) {
                return const LoadingWidget();
              }
              var orders = BlocProvider.of<OrderUserCubit>(context)
                  .lastOrder['message'];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 1.0),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return AllOrderWidget(index: index, order: orders[index] );
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
