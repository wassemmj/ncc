import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ncc_app/logic/discount_cubit/discount_cubit.dart';
import 'package:ncc_app/logic/get_discount_cubit/get_discount_cubit.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';
import 'package:http/http.dart' as http;

import '../../../core/api.dart';
import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../../core/token.dart';
import '../../nav_view/widget/appbar_icon.dart';

class ShowDiscountView extends StatefulWidget {
  const ShowDiscountView({Key? key}) : super(key: key);

  @override
  State<ShowDiscountView> createState() => _ShowDiscountViewState();
}

class _ShowDiscountViewState extends State<ShowDiscountView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<GetDiscountCubit>(context).getAdd();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          'Discounts',
          style: Style.textStyle23,
        ),
        actions: [
          Container(
              padding: EdgeInsets.all((height / 108)),
              child: AppbarIcon(
                icon: Icons.delete,
                onPressed: () async {
                  var response = await http.post(
                      Uri.parse('${Api.api}/category/Section/product/DeleteAllDiscounts'),
                      headers: {
                        'Accept': 'application/json',
                        'Authorization': 'Bearer ${Token.token}'
                      }
                  );
                  print(response.body);
                  if(response.statusCode == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("all discount deleted")));
                  }
                }, color: Colors.black54.withOpacity(0.03),)) ,
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<GetDiscountCubit, GetDiscountState>(
          builder: (context, state) {
            if(BlocProvider.of<GetDiscountCubit>(context).discounts == null) {
              return const LoadingWidget();
            }
            var discounts = BlocProvider.of<GetDiscountCubit>(context).discounts['discount'];
            return Container(
              padding: EdgeInsets.all((height / 43.37)),
              width: width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: discounts.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      key: const ValueKey(0),
                      children: [
                        BlocListener<DiscountCubit, DiscountState>(
                          listener: (context, state) {
                            if(state.status == DiscountStatus.success) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Deleted Successfully')));
                            }
                          },
                          child: SlidableAction(
                            key: const ValueKey(0),
                            onPressed: (context)  async {
                              await BlocProvider.of<DiscountCubit>(context).deleteDiscountProduct(discounts[index]['product_id'],1);
                            },
                            backgroundColor: Color1.white,
                            foregroundColor: const Color(0xFFFE4A49),
                            icon: Icons.delete,
                          ),
                        ),
                      ],
                    ),
                    child: Container(
                      height: height * 0.05,
                      width: width,
                      margin: EdgeInsets.all(height * 0.022),
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black54, width: 0.4),
                          )),
                      child: SizedBox(
                        width: width / 2.2,
                        child: Text(
                          discounts[index]['percentage_off'].toString(),
                          style: const TextStyle(
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                          maxLines: 2,
                        ),
                      ),
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
