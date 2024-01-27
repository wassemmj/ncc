import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncc_app/data/models/monitor_model.dart';
import 'package:ncc_app/logic/create_cubit/create_cubit.dart';
import 'package:ncc_app/views/admin/add_more_details_view/widget/add_more_buttons.dart';

import '../../../core/style.dart';
import '../../nav_view/widget/appbar_icon.dart';
import '../awidget/custom_text_from_field.dart';

class CreateMonitorDetails extends StatelessWidget {
  CreateMonitorDetails({Key? key, required this.id}) : super(key: key);

  final int id;

  var displaySize = TextEditingController();
  var displaTechnology = TextEditingController();
  var displayResolution = TextEditingController();
  var contrastRatio = TextEditingController();
  var responseTime = TextEditingController();
  var signalFrequency = TextEditingController();
  var multimediaSpeakers = TextEditingController();
  var ports = TextEditingController();
  var warranty = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            padding: EdgeInsets.all((height / 108)),
            child: AppbarIcon(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.black54.withOpacity(0.03),
            )),
      ),
      body: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create More Details',
                style: Style.textStyle23,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextFromField(
                controller: displaySize,
                hint: 'Display Size',
                iconData: FontAwesomeIcons.tv,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFromField(
                controller: displaTechnology,
                hint: 'Display Technology',
                iconData: FontAwesomeIcons.tv,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFromField(
                controller: displayResolution,
                hint: 'Display Resolution',
                iconData: FontAwesomeIcons.tv,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFromField(
                controller: contrastRatio,
                hint: 'Contrast Ration',
                iconData: FontAwesomeIcons.tv,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFromField(
                controller: responseTime,
                hint: 'Response Time',
                iconData: FontAwesomeIcons.tv,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFromField(
                controller: signalFrequency,
                hint: 'Signal Frequency',
                iconData: FontAwesomeIcons.tv,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFromField(
                controller: multimediaSpeakers,
                hint: 'Multimedia Speaker',
                iconData: FontAwesomeIcons.tv,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFromField(
                controller: ports,
                hint: 'Ports',
                iconData: FontAwesomeIcons.tv,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFromField(
                controller: warranty,
                hint: 'Warranty',
                iconData: FontAwesomeIcons.tv,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              AddMoreButtons(onPressed: () async {
                var laptopModel = MonitorModel(displaySize: displaySize.text,
                    displaTechnology: displaTechnology.text,
                    displayResolution: displayResolution.text,
                    contrastRatio: contrastRatio.text,
                    responseTime: responseTime.text,
                    signalFrequency: signalFrequency.text,
                    multimediaSpeakers: multimediaSpeakers.text,
                    ports: ports.text,
                    warranty: warranty.text,
                );
                await BlocProvider.of<CreateCubit>(context)
                    .createMonitorDetails(laptopModel, id);
              }, text: 'Create'),
            ],
          ),
        ),
      ),
    );
  }
}
