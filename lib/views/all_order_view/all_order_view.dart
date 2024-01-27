import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  bool expandFlag = false;

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
                      return Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'order ${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      orders[index]['status'] == 'accepted'
                                          ? Icons.done
                                          : orders[index]['status'] != 'rejected'
                                          ? Icons.access_time_outlined
                                          : FontAwesomeIcons.x,
                                      color: orders[index]['status'] == 'rejected' ? Colors.red :  Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(width: orders[index]['status'] == 'rejected' ? 0 : 10),
                                    orders[index]['status'] == 'rejected' ? Container() : Icon(
                                      orders[index]['location'] == 'In Stock'
                                          ? FontAwesomeIcons.truckFast
                                          : orders[index]['location'] != 'Arrived'
                                          ? FontAwesomeIcons.truckArrowRight
                                          : FontAwesomeIcons.truckFront,
                                      color: Colors.black,
                                      size: 20,
                                    ) ,
                                    IconButton(
                                        icon: Icon(
                                          expandFlag
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          color: Colors.black,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            expandFlag = !expandFlag;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0,
                                    color: Colors.black54.withOpacity(0.06))),
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            width: width,
                            height: expandFlag
                                ? (height * 0.22) *
                                orders[index]['products'].length
                                : 0,
                            child: SizedBox(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, ind) {
                                  return OrderAdminWidget(
                                    product: orders[index]['products'][ind],
                                  );
                                },
                                itemCount: orders[index]['products'].length,
                              ),
                            ),
                          ),
                          Text(
                            orders[index]['shipping_address'],
                            style: const TextStyle(
                              color: Color1.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                          ),
                          TextButton(
                            onPressed: () => launchUrl(Uri.parse("tel://${orders[index]['phone_number']}")),
                            child: Text(
                              orders[index]['phone_number'].toString(),
                              style: Style.textStyle14,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                            child: PriceText(
                                text: 'Total ',
                                price: '${orders[index]['total_amount']} JOD',
                                discount: false),
                          ),
                        ],
                      );
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
