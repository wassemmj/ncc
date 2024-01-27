import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/edit_cubit/edit_cubit.dart';

import '../../../core/color1.dart';
import '../change_color_view/widget/change_color_button.dart';
import 'custom_text_from_field.dart';

class EditAlert extends StatelessWidget {
  const EditAlert({Key? key, required this.id, required this.last, required this.cat}) : super(key: key);

  final int id;
  final String last;
  final bool cat;


  @override
  Widget build(BuildContext context) {
  var p = TextEditingController(text: last);
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
                if(cat) {
                  await BlocProvider.of<EditCubit>(context)
                      .editCat(id, p.text);
                }
                else {
                  await BlocProvider.of<EditCubit>(context)
                      .editSector(id, p.text);
                }

                Navigator.of(context).pop();
              }),
        ),
      ],
      content: CustomTextFromField(
        controller: p,
        hint: 'Category Type',
        iconData: Icons.category_outlined,
      ),
    );
  }
}
