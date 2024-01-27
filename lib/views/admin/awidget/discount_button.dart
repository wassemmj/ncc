import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/awidget/custom_text_from_field.dart';
import 'package:ncc_app/views/admin/awidget/discount_body.dart';
import 'package:ncc_app/views/admin/awidget/discount_choice.dart';


class DiscountButton extends StatelessWidget {
  DiscountButton({Key? key, required this.id, required this.type, required this.deleteId}) : super(key: key);

  final int id;
  final int type;
  final int deleteId;

  var p = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: (height / 21.68),
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.03),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return DiscountChoice(id: id, type: type, deleteId: deleteId,);
            },
          );
        },
        icon: Icon(
          Icons.percent_outlined,
          color: Colors.red,
          size: (height / 39.42),
        ),
      ),
    );
  }
}
