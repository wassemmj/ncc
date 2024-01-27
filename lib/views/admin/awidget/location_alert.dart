import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/color1.dart';
import '../../../logic/status_cubit/status_cubit.dart';
import '../change_color_view/widget/change_color_button.dart';

class LocationAlert extends StatefulWidget {
  const LocationAlert({Key? key, required this.id, required this.valueOld}) : super(key: key);

  final int id;

  final String? valueOld;

  @override
  State<LocationAlert> createState() => _LocationAlertState();
}

class _LocationAlertState extends State<LocationAlert> {
  List<String> items = [
    'In Stock',
    'Shipped',
    'Arrived',
  ];

  String? value = '';

  @override
  void initState() {
    value = widget.valueOld;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Status',
        style: TextStyle(
          color: Color1.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Status',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          DropdownButton(
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            icon: const Icon(Icons.keyboard_arrow_down),
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value!;
              });
            },
            iconEnabledColor: Color1.primaryColor,
          ),
        ],
      ),
      actions: [
        ChangeColorButton(
            text: 'Cancel',
            onPressed: () {
              Navigator.of(context).pop();
            }),
        BlocListener<StatusCubit, StatusState>(
          listener: (context, state) {
            if (state.status == StatusStatus.success) {}
          },
          child: ChangeColorButton(
              text: 'done',
              onPressed: () async {
                await BlocProvider.of<StatusCubit>(context).changeStatus(widget.id, value!);
                Navigator.of(context).pop();
              }),
        ),
      ],
    );
  }
}
