import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/color1.dart';
import '../../../../logic/footer_cubit/footer_cubit.dart';

class CreateCompanyInfoButton extends StatelessWidget {
  const CreateCompanyInfoButton({Key? key, required this.email, required this.address, required this.description, required this.numbers, required this.fAccount, required this.iAccount, required this.tAccount}) : super(key: key);

  final String email;
  final String address;
  final String description;
  final List<String> numbers;
  final String fAccount;
  final String iAccount;
  final String tAccount;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FooterCubit,FooterState>(
      listener: (context, state) {
        if(state.status == FooterStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Footer Created Successfully')));
        }
      },
      builder: (context, state) {
        if(state.status == FooterStatus.loading) {
          return Container(
            padding: const EdgeInsets.only(right: 15),
            alignment: Alignment.topRight,
            child: CircularProgressIndicator(color: Color1.primaryColor,strokeWidth: 1,),
          );
        }
        return Container(
          alignment: Alignment.topRight,
          child: ElevatedButton(
              onPressed: () async {
                var v = BlocProvider.of<FooterCubit>(context);
                await v.addFooter(email, address, description, numbers, fAccount, iAccount, tAccount);
                if(state.status == FooterStatus.success) {
                  await v.getFooter();
                }
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)))),
              child: const Text(
                'Create',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w400),
              )),
        );
      },
    );
  }
}
