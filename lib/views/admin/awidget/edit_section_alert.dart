import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/api.dart';
import '../../../core/color1.dart';
import '../../../logic/edit_cubit/edit_cubit.dart';
import '../change_color_view/widget/change_color_button.dart';
import 'custom_text_from_field.dart';

class EditSectionAlert extends StatefulWidget {
  const EditSectionAlert({Key? key, required this.id, required this.last, this.pickedImage}) : super(key: key);

  final int id;
  final String? pickedImage;
  final String last;

  @override
  State<EditSectionAlert> createState() => _EditSectionAlertState();
}

class _EditSectionAlertState extends State<EditSectionAlert> {
  File? pp ;

  @override
  Widget build(BuildContext context) {
    var p = TextEditingController(text: widget.last);
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
                  await BlocProvider.of<EditCubit>(context)
                      .editSec(widget.id, p.text,pp!);
                Navigator.of(context).pop();
              }),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          pp != null
              ? Center(
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(80),
                child: Image.file(
                  pp!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
              : widget.pickedImage !=null ? Center(
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(80),
                child: Image.network(
                  '${Api.apiImage}/section/${widget.pickedImage}',
                ),
              ),
            ),
          ): Container(),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(
                  source: ImageSource.camera,
                );
                if (image == null) {
                  return;
                }
                setState(() {
                 pp = File(image.path);
                });
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.all(8)),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
              child: const Text(
                'Choose photo',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(height: 10),
          CustomTextFromField(
            controller: p,
            hint: 'Category Type',
            iconData: Icons.category_outlined,
          ),
        ],
      ),
    );
  }
}
