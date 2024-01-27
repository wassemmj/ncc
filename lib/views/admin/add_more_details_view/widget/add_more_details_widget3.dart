import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../awidget/custom_text_from_field.dart';

class AddMoreDetailsWidget3 extends StatelessWidget {
  const AddMoreDetailsWidget3(
      {Key? key,
      required this.portsController,
      required this.cameraController,
      required this.audioController,
      required this.networkController,
      required this.batteryCellsController,
      required this.operatingSystemController,
      required this.warrantyController,
      required this.opticalDriveController})
      : super(key: key);

  final TextEditingController portsController;
  final TextEditingController cameraController;
  final TextEditingController audioController;
  final TextEditingController networkController;
  final TextEditingController batteryCellsController;
  final TextEditingController operatingSystemController;
  final TextEditingController warrantyController;
  final TextEditingController opticalDriveController;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomTextFromField(
          controller: portsController,
          hint: 'Ports',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: cameraController,
          hint: 'Camera',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: audioController,
          hint: 'Audio',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: networkController,
          hint: 'Network',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: batteryCellsController,
          hint: 'Battery Number of Cells',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: operatingSystemController,
          hint: 'Operating System',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: warrantyController,
          hint: 'Warranty',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFromField(
          controller: opticalDriveController,
          hint: 'Optical Drive',
          iconData: FontAwesomeIcons.laptop,
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
