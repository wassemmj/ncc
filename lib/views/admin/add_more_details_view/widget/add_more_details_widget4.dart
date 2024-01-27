import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../awidget/custom_text_from_field.dart';

class AddMoreDetailsWidget4 extends StatelessWidget {
  const AddMoreDetailsWidget4(
      {Key? key,
      required this.caseModelController,
      required this.lightTypeController,
      required this.powerSupplyController,
      required this.multimediaController})
      : super(key: key);

  final TextEditingController caseModelController;
  final TextEditingController lightTypeController;
  final TextEditingController powerSupplyController;
  final TextEditingController multimediaController;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomTextFromField(
          controller: caseModelController,
          hint: 'Case Model',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: lightTypeController,
          hint: 'Light Type',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: powerSupplyController,
          hint: 'Power Supply',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: multimediaController,
          hint: 'Multi Media',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
