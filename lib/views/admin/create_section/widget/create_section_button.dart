import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/color1.dart';
import '../../../../logic/create_cubit/create_cubit.dart';

class CreateSectionButton extends StatelessWidget {
  const CreateSectionButton({Key? key, required this.type, required this.catId, required this.image}) : super(key: key);

  final String type;
  final int catId;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateCubit,CreateState>(
      listener: (context, state) {
        if(state.status == CreateStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Section Created Successfully')));
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
              onPressed: () async {
                await BlocProvider.of<CreateCubit>(context).createSec(type, image, catId);
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
