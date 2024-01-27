import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/order_admin_cubit/order_admin_cubit.dart';
import 'package:ncc_app/views/admin/order_admin_view/widget/expandable_list_view.dart';
import 'package:ncc_app/views/admin/order_admin_view/widget/order_type_widget.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';


class OrderAdminView extends StatefulWidget {
  const OrderAdminView({Key? key}) : super(key: key);

  @override
  State<OrderAdminView> createState() => _OrderAdminViewState();
}

class _OrderAdminViewState extends State<OrderAdminView> {
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<OrderAdminCubit>(context, listen: false)
          .getAllOrder();
    });
    super.initState();
  }

  var orders;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: OrderTypeWidget(
                onChanged: (index) async {
                  if (index == 0) {
                    await BlocProvider.of<OrderAdminCubit>(context)
                        .getAllOrder();
                    orders = BlocProvider.of<OrderAdminCubit>(context)
                        .allOrder['message'];
                  } else if (index == 1) {
                    await BlocProvider.of<OrderAdminCubit>(context)
                        .getInStockOrder();
                    orders = BlocProvider.of<OrderAdminCubit>(context)
                        .stockOrder['orders'];
                  } else if (index == 2) {
                    await BlocProvider.of<OrderAdminCubit>(context)
                        .getOnWayOrder();
                    orders = BlocProvider.of<OrderAdminCubit>(context)
                        .onWayOrder['orders'];
                  } else {
                    await BlocProvider.of<OrderAdminCubit>(context).getArrived();
                    orders = BlocProvider.of<OrderAdminCubit>(context)
                        .arrivedOrder['orders'];
                  }
                  setState(() => currentIndex = index);
                },
                currentIndex: currentIndex),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<OrderAdminCubit, OrderAdminState>(
              builder: (context, state) {
                if (state.status == OrderAdminStatus.initial ||
                    state.status == OrderAdminStatus.loading) {
                  return const LoadingWidget();
                }
                if (BlocProvider.of<OrderAdminCubit>(context).allOrder == null) {
                  return const LoadingWidget();
                }
                if(currentIndex == 0) {
                  orders = BlocProvider.of<OrderAdminCubit>(context)
                      .allOrder['message'];
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ExpandableListView(
                      title: "Order ${index + 1}",
                      order: orders[index],
                    );
                  },
                  itemCount: orders.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
