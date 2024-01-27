import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../awidget/custom_text_from_field.dart';

class AddMoreDetailsWidget1 extends StatelessWidget {
  const AddMoreDetailsWidget1(
      {Key? key,
      required this.processGenerationController,
      required this.processFamilyController,
      required this.processSpeedController,
      required this.processCashController,
      required this.numberCouresController,
      required this.ramController,
      required this.memoryTypeController,
      required this.memoryCapacityController,
      required this.storageTypeController})
      : super(key: key);

  final TextEditingController processGenerationController;
  final TextEditingController processFamilyController;
  final TextEditingController processSpeedController;

  final TextEditingController processCashController;
  final TextEditingController numberCouresController;
  final TextEditingController ramController;

  final TextEditingController memoryTypeController;
  final TextEditingController memoryCapacityController;

  final TextEditingController storageTypeController;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomTextFromField(
          controller: processGenerationController,
          hint: 'Process Generation',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        CustomTextFromField(
          controller: processFamilyController,
          hint: 'Process Family',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        CustomTextFromField(
          controller: processSpeedController,
          hint: 'Process Speed',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        CustomTextFromField(
          controller: processCashController,
          hint: 'Process Cash',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        CustomTextFromField(
          controller: numberCouresController,
          hint: 'Coures number',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        CustomTextFromField(
          controller: ramController,
          hint: 'Ram Capacity',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        CustomTextFromField(
          controller: memoryTypeController,
          hint: 'Memory Type',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        CustomTextFromField(
          controller: memoryCapacityController,
          hint: 'Storage Capacity',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        CustomTextFromField(
          controller: storageTypeController,
          hint: 'Storage Type',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
