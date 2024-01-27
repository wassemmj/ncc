import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/account_cubit/account_cubit.dart';
import 'package:ncc_app/views/account_view/account_edit_button.dart';
import 'package:ncc_app/views/account_view/account_text_widget.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';


class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<AccountCubit>(context, listen: false).getAccount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state.status == AccountStatus.initial ||
            state.status == AccountStatus.loading) {
          return const LoadingWidget();
        }
        if (BlocProvider.of<AccountCubit>(context).account == null) {
          return const LoadingWidget();
        }
        var account =
        BlocProvider.of<AccountCubit>(context).account['user'];
        return Column(
          children: [
            AccountTextWidget(text1: 'Name', text2: account['name']),
            AccountTextWidget(text1: 'Email', text2: account['email']),
            AccountTextWidget(text1: 'Address', text2: account['address'] ?? '_'),
            SizedBox(height: height * 0.02,),
            AccountEditButton(nameT: account['name'], emailT: account['email'], addressT: account['address'] ?? '_'),
          ],
        );
      },
    );
  }
}
