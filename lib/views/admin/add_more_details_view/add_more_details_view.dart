import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/data/models/laptop_model.dart';
import 'package:ncc_app/logic/create_cubit/create_cubit.dart';
import 'package:ncc_app/views/admin/add_more_details_view/widget/add_more_buttons.dart';
import 'package:ncc_app/views/admin/add_more_details_view/widget/add_more_details_widget1.dart';
import 'package:ncc_app/views/admin/add_more_details_view/widget/add_more_details_widget2.dart';
import 'package:ncc_app/views/admin/add_more_details_view/widget/add_more_details_widget3.dart';
import 'package:ncc_app/views/admin/add_more_details_view/widget/add_more_details_widget4.dart';

import '../../../core/style.dart';
import '../../nav_view/widget/appbar_icon.dart';

class AddMoreDetailsView extends StatefulWidget {
  const AddMoreDetailsView({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<AddMoreDetailsView> createState() => _AddMoreDetailsViewState();
}

class _AddMoreDetailsViewState extends State<AddMoreDetailsView> {
  var processGenerationController = TextEditingController();
  var processFamilyController = TextEditingController();
  var processSpeedController = TextEditingController();
  var processCashController = TextEditingController();
  var numberCouresController = TextEditingController();
  var ramController = TextEditingController();
  var memoryTypeController = TextEditingController();
  var memoryCapacityController = TextEditingController();
  var storageTypeController = TextEditingController();

  var graphicManufacturController = TextEditingController();
  var graphicModelController = TextEditingController();
  var graphicMemorySourceController = TextEditingController();
  var graphicDisplaySizeController = TextEditingController();
  var graphicDisplayTechnologyController = TextEditingController();
  var graphicDisplayResolutionController = TextEditingController();
  var keyboardController = TextEditingController();
  var keyboardBackLightController = TextEditingController();

  var portsController = TextEditingController();
  var cameraController = TextEditingController();
  var audioController = TextEditingController();
  var networkController = TextEditingController();
  var batteryCellsController = TextEditingController();
  var operatingSystemController = TextEditingController();
  var warrantyController = TextEditingController();
  var opticalDriveController = TextEditingController();

  var caseModelController = TextEditingController();
  var lightTypeController = TextEditingController();
  var powerSupplyController = TextEditingController();
  var multimediaController = TextEditingController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List screens = [
      AddMoreDetailsWidget1(
        processGenerationController: processGenerationController,
        processFamilyController: processFamilyController,
        processSpeedController: processSpeedController,
        processCashController: processCashController,
        numberCouresController: numberCouresController,
        ramController: ramController,
        memoryTypeController: memoryTypeController,
        memoryCapacityController: memoryCapacityController,
        storageTypeController: storageTypeController,
      ),
      AddMoreDetailsWidget2(
          graphicManufacturController: graphicManufacturController,
          graphicModelController: graphicModelController,
          graphicMemorySourceController: graphicMemorySourceController,
          graphicDisplaySizeController: graphicDisplaySizeController,
          graphicDisplayTechnologyController:
              graphicDisplayTechnologyController,
          graphicDisplayResolutionController:
              graphicDisplayResolutionController,
          keyboardController: keyboardController,
          keyboardBackLightController: keyboardBackLightController),
      AddMoreDetailsWidget3(
          portsController: portsController,
          cameraController: cameraController,
          audioController: audioController,
          networkController: networkController,
          batteryCellsController: batteryCellsController,
          operatingSystemController: operatingSystemController,
          warrantyController: warrantyController,
          opticalDriveController: opticalDriveController),
      AddMoreDetailsWidget4(
          caseModelController: caseModelController,
          lightTypeController: lightTypeController,
          powerSupplyController: powerSupplyController,
          multimediaController: multimediaController),
    ];
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                SizedBox(height: height * 0.02),
                screens[currentIndex],
                AddMoreButtons(
                  onPressed: currentIndex != screens.length - 1
                      ? () {
                          setState(() {
                            currentIndex++;
                          });
                        }
                      : () async {
                          var laptopModel = LaptopModel(
                            audio: audioController.text,
                            batteryNumberOfCells: batteryCellsController.text,
                            camera: cameraController.text,
                            caseModel: caseModelController.text,
                            displaTechnology:
                                graphicDisplayTechnologyController.text,
                            displayResolution:
                                graphicDisplayResolutionController.text,
                            displaySize: graphicDisplaySizeController.text,
                            graphicManufacturer:
                                graphicManufacturController.text,
                            graphicMemorySource:
                                graphicMemorySourceController.text,
                            graphicModel: graphicModelController.text,
                            keyboard: keyboardController.text,
                            keyboardBacklight: keyboardBackLightController.text,
                            lightType: lightTypeController.text,
                            memoryType: memoryTypeController.text,
                            multiMedia: multimediaController.text,
                            networking: networkController.text,
                            numberOfCoures: numberCouresController.text,
                            operationSystem: operatingSystemController.text,
                            opticalDrive: opticalDriveController.text,
                            ports: portsController.text,
                            powerSupply: powerSupplyController.text,
                            processorCash: processCashController.text,
                            processorFamily: processFamilyController.text,
                            processorGeneration:
                                processGenerationController.text,
                            processorSpeed: processSpeedController.text,
                            ramCapacity: ramController.text,
                            storageCapacity: memoryCapacityController.text,
                            storageType: storageTypeController.text,
                            warranty: warrantyController.text,
                          );
                          await BlocProvider.of<CreateCubit>(context)
                              .createMoreDetails(laptopModel, widget.id);
                        },
                  text: currentIndex != screens.length - 1 ? 'Next' : 'Done',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
