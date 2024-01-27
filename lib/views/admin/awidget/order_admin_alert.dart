import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/color1.dart';
import '../../../logic/status_cubit/status_cubit.dart';

class OrderAdminAlert extends StatelessWidget {
  const OrderAdminAlert({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Accept the Order',
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
          Row(
            children: [
              BlocListener<StatusCubit, StatusState>(
                listener: (context, state) {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black54.withOpacity(0.05))
                  ),
                  child: IconButton(icon: const Icon(Icons.done,color: Colors.green),onPressed: () async {
                    await BlocProvider.of<StatusCubit>(context).acceptOrder(id);
                    Navigator.of(context).pop();
                  },),
                ),
              ),
              BlocListener<StatusCubit, StatusState>(
                listener: (context, state) {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black54.withOpacity(0.05))
                  ),
                  child: IconButton(icon: const Icon(FontAwesomeIcons.x, color: Colors.red,),onPressed: () async {
                    await BlocProvider.of<StatusCubit>(context).rejectOrder(id);
                    Navigator.of(context).pop();
                  },),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
