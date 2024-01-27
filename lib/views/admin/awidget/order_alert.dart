import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/filter_order_cubit/filter_order_cubit.dart';
import 'package:ncc_app/views/admin/change_color_view/widget/change_color_button.dart';

import '../../../core/color1.dart';

class OrderAlert extends StatelessWidget {
  const OrderAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Filter Order',
        style: TextStyle(
            color: Color1.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ),
      actions: [
        ChangeColorButton(text: 'Cancel', onPressed: ()=> Navigator.of(context).pop()),
      ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocListener<FilterOrderCubit, FilterOrderState>(
              listener: (context, state) {
                if(state.status ==  FilterOrderStatus.success) {
                }
              },
              child: TextButton(
                onPressed: () async {
                  await BlocProvider.of< FilterOrderCubit>(context).filterArrived();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Filter Arrived',
                  style: TextStyle(
                    color: Color1.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await BlocProvider.of< FilterOrderCubit>(context).filterRejected();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Filter Rejected',
                style: TextStyle(
                  color: Color1.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
