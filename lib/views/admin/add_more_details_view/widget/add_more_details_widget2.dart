import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../awidget/custom_text_from_field.dart';

class AddMoreDetailsWidget2 extends StatelessWidget {
  const AddMoreDetailsWidget2(
      {Key? key,
      required this.graphicManufacturController,
      required this.graphicModelController,
      required this.graphicMemorySourceController,
      required this.graphicDisplaySizeController,
      required this.graphicDisplayTechnologyController,
      required this.graphicDisplayResolutionController,
      required this.keyboardController,
      required this.keyboardBackLightController})
      : super(key: key);

  final TextEditingController graphicManufacturController;
  final TextEditingController graphicModelController;
  final TextEditingController graphicMemorySourceController;
  final TextEditingController graphicDisplaySizeController;
  final TextEditingController graphicDisplayTechnologyController;
  final TextEditingController graphicDisplayResolutionController;
  final TextEditingController keyboardController;
  final TextEditingController keyboardBackLightController;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomTextFromField(
          controller: graphicManufacturController,
          hint: 'Graphic Manufactur',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: graphicModelController,
          hint: 'Graphic Model',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: graphicMemorySourceController,
          hint: 'Graphic Memory Source',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: graphicDisplaySizeController,
          hint: 'Graphic Display Size',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: graphicDisplayTechnologyController,
          hint: 'Graphic Display Technology',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: graphicDisplayResolutionController,
          hint: 'Graphic Display Resolution',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: keyboardController,
          hint: 'Keyboard',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: keyboardBackLightController,
          hint: 'Keyboard BackLight',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
