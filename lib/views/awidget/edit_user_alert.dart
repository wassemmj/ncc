import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/color1.dart';
import '../../logic/account_cubit/account_cubit.dart';
import '../admin/awidget/custom_text_from_field.dart';
import '../admin/change_color_view/widget/change_color_button.dart';

class EditUserAlert extends StatelessWidget {
  const EditUserAlert({Key? key, required this.name, required this.email, required this.address}) : super(key: key);

  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController address;

  @override
  Widget build(BuildContext context) {
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
        BlocListener<AccountCubit, AccountState>(
          listener: (context, state) {
            if (state.status == AccountStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edited Successfully')));
            }
          },
          child: ChangeColorButton(
              text: 'done',
              onPressed: () async {
                var w = BlocProvider.of<AccountCubit>(context);
                await w.updateAccount(name.text, email.text, address.text);
                await w.getAccount();
                Navigator.of(context).pop();
              }),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFromField(
            controller: name,
            hint: 'Name',
            iconData: Icons.person,
          ),
          CustomTextFromField(
            controller: email,
            hint: 'Email',
            iconData: Icons.email,
          ),
          CustomTextFromField(
            controller: address,
            hint: 'Address',
            iconData: Icons.location_on_outlined,
          ),
        ],
      ),
    );
  }
}
