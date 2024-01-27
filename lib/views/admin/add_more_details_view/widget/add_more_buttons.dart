import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/color1.dart';
import '../../../../logic/create_cubit/create_cubit.dart';

class AddMoreButtons extends StatelessWidget {
  const AddMoreButtons({Key? key, required this.onPressed, required this.text}) : super(key: key);

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateCubit,CreateState>(
      listener: (context, state) {
        if(state.status == CreateStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('More Details Added Successfully')));
        }
      },
      builder: (context, state) {
        if(state.status == CreateStatus.loading) {
          return Container(
            padding: const EdgeInsets.only(right: 15),
            alignment: Alignment.topRight,
            child: CircularProgressIndicator(color: Color1.primaryColor,strokeWidth: 1,),
          );
        }
        return Container(
          alignment: Alignment.topRight,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)))),
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w400),
              )),
        );
      },
    );
  }
}
