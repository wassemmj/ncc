import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/awidget/edit_product_alert.dart';

import '../../../core/color1.dart';
import '../../../logic/edit_cubit/edit_cubit.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key, required this.id, required this.lastPrice, required this.lastQuantity, required this.ava}) : super(key: key);

  final int id;
  final String lastPrice;
  final String lastQuantity;
  final String ava;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocListener<EditCubit, EditState>(
      listener: (context, state) {
        if(state.status == EditStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product deleted Successfully')));
        }
      },
      child: Container(
        width: (height / 21.68),
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.03),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () async {
            showDialog(context: context, builder: (context) => EditProductAlert(lastPrice: lastPrice, id: id,lastQuantity: lastQuantity, ava: ava,),);
          },
          icon: Icon(
            Icons.edit,
            color: Color1.black,
            size: (height / 39.42),
          ),
        ),
      ),
    );
  }
}
