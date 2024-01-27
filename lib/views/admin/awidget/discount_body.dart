import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/color1.dart';
import '../../../logic/discount_cubit/discount_cubit.dart';
import '../change_color_view/widget/change_color_button.dart';
import 'custom_text_from_field.dart';

class DiscountBody extends StatelessWidget {
  DiscountBody({Key? key, required this.id, required this.type}) : super(key: key);

  final int id;
  final int type;

  var p = TextEditingController();

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
        BlocListener<DiscountCubit, DiscountState>(
          listener: (context, state) {
            if (state.status == DiscountStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Discount done')));
            }
          },
          child: ChangeColorButton(
              text: 'done',
              onPressed: () async {
                await BlocProvider.of<DiscountCubit>(context)
                    .makeDiscountProduct(id, int.parse(p.text),type);
                Navigator.of(context).pop();
              }),
        ),
      ],
      content: CustomTextFromField(
        controller: p,
        hint: 'Percentage off',
        iconData: Icons.percent_outlined,
      ),
    );
  }
}
