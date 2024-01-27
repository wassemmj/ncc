import 'package:flutter/material.dart';
import 'package:ncc_app/views/admin/awidget/delete_button.dart';
import 'package:ncc_app/views/admin/create_monitor_details/create_monitor_details.dart';
import 'package:ncc_app/views/admin/details_admin_view/details_admin_view.dart';

import '../admin/add_more_details_view/add_more_details_view.dart';

class ProductAlert extends StatelessWidget {
  const ProductAlert({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DeleteButton(id: id),
          TextButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateMonitorDetails(id: id,),));
          }, child: const Text("Add Monitor Details")),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddMoreDetailsView(id: id,),));
          }, child: const Text('Add Laptop Details')),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsAdminView(productId: id)));
          }, child: const Text('Show Details')),
        ],
      ),
    );
  }
}
