import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/add_cubit/add_cubit.dart';

import '../../../../core/color1.dart';

class CreateAdvertButton extends StatelessWidget {
  const CreateAdvertButton({Key? key, required this.image, required this.type}) : super(key: key);

  final File? image;
  final String type;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<AddCubit, AddState>(
      builder: (context, state) {
        if (state.status == AddStatus.loading) {
          return Container(
            alignment: Alignment.topRight,
            child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ),
          );
        }
        return Container(
        alignment: Alignment.topRight,
        child: ElevatedButton(
            onPressed: () async {
              await BlocProvider.of<AddCubit>(context).makeAdd(image!, type);
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
                elevation: MaterialStateProperty.all(10),
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
