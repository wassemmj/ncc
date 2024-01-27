import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/discount_cubit/discount_cubit.dart';
import 'package:ncc_app/views/admin/awidget/discount_body.dart';

import '../../../core/color1.dart';
import '../change_color_view/widget/change_color_button.dart';

class DiscountChoice extends StatelessWidget {
  const DiscountChoice({Key? key, required this.id, required this.type, required this.deleteId})
      : super(key: key);

  final int id;
  final int deleteId;
  final int type;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Percentage off',
        style: TextStyle(
            color: Color1.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ),
      actions: <Widget>[
        ChangeColorButton(
            text: 'Cancel',
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocListener<DiscountCubit, DiscountState>(
            listener: (context, state) {
              if(state.status == DiscountStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(BlocProvider.of<DiscountCubit>(context).message['message'].toString())));
              }
            },
            child: TextButton(
              onPressed: () async {
                await BlocProvider.of<DiscountCubit>(context).deleteDiscountProduct(deleteId, type);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Delete Discount',
                style: TextStyle(
                  color: Color1.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) => DiscountBody(id: id, type: type),
              );
            },
            child: const Text(
              'Add Discount',
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
