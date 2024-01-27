import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/color_cubit/color_cubit.dart';
import 'package:ncc_app/views/admin/change_color_view/widget/change_color_button.dart';

import '../../../core/color1.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ChangeColorView extends StatefulWidget {
  const ChangeColorView({Key? key}) : super(key: key);

  @override
  State<ChangeColorView> createState() => _ChangeColorViewState();
}

class _ChangeColorViewState extends State<ChangeColorView> {
  Color pickerColor = Color1.primaryColor;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Color',
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
        BlocListener<ColorCubit, ColorState>(
          listener: (context, state) {},
          child: ChangeColorButton(
              text: 'done',
              onPressed: () async {
                print(pickerColor.alpha / 255);
                await BlocProvider.of<ColorCubit>(context).updateColor(
                    pickerColor.red,
                    pickerColor.green,
                    pickerColor.blue,
                    pickerColor.alpha / 255);
                setState(() {
                  Color1.primaryColor = pickerColor;
                });
                Navigator.of(context).pop();
              }),
        ),
      ],
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: pickerColor,
          paletteType: PaletteType.hueWheel,
          onColorChanged: changeColor,
        ),
      ),
    );
  }
}
