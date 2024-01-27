import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/color1.dart';
import '../../../logic/edit_cubit/edit_cubit.dart';
import '../change_color_view/widget/change_color_button.dart';
import 'custom_text_from_field.dart';

class EditProductAlert extends StatelessWidget {
  const EditProductAlert({Key? key, required this.lastPrice, required this.id, required this.lastQuantity, required this.ava}) : super(key: key);

  final String  lastPrice;
  final int id;
  final String  lastQuantity;
  final String ava;

  @override
  Widget build(BuildContext context) {
    var p = TextEditingController(text: lastPrice);
    var pp = TextEditingController(text: lastQuantity);
    var ppp = TextEditingController(text: ava);
    return AlertDialog(
      title: Text(
        'Edit',
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
        BlocListener<EditCubit, EditState>(
          listener: (context, state) {
            if (state.status == EditStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edited Successfully')));
            }
          },
          child: ChangeColorButton(
              text: 'done',
              onPressed: () async {
                await BlocProvider.of<EditCubit>(context).editProduct(id, p.text, pp.text,ppp.text);
                Navigator.of(context).pop();
              }),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFromField(
            controller: pp,
            hint: 'Quantity',
            iconData: Icons.category_outlined,
          ),
          CustomTextFromField(
            controller: p,
            hint: 'Price',
            iconData: Icons.price_change,
          ),
          CustomTextFromField(
            controller: ppp,
            hint: 'Availability',
            iconData: Icons.price_change,
          ),
        ],
      ),
    );
  }
}
