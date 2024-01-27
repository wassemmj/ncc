import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ncc_app/logic/delete_cubit/delete_cubit.dart';
import 'package:ncc_app/views/admin/awidget/discount_body.dart';
import 'package:ncc_app/views/admin/awidget/discount_choice.dart';
import 'package:ncc_app/views/admin/awidget/edit_alert.dart';
import 'package:ncc_app/views/admin/section_admin_view/section_admin_view.dart';

import '../../../../core/color1.dart';

class PCSWidget extends StatefulWidget {
  const PCSWidget({Key? key, required this.category}) : super(key: key);

  final Map category;

  @override
  State<PCSWidget> createState() => _PCSWidgetState();
}

class _PCSWidgetState extends State<PCSWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        key: const ValueKey(0),
        children: [
          BlocListener<DeleteCubit, DeleteState>(
            listener: (context, state) {
              if(state.status == DeleteStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Category Deleted Successfully')));
              }
            },
            child: SlidableAction(
              key: const ValueKey(0),
              onPressed: (context)  async {
                await BlocProvider.of<DeleteCubit>(context).deleteCat(widget.category['id']);
              },
              backgroundColor: Color1.white,
              foregroundColor: const Color(0xFFFE4A49),
              icon: Icons.delete,
            ),
          ),
          SlidableAction(
            key: const ValueKey(0),
            onPressed: (context) {
              showDialog(context: context, builder: (context) => DiscountChoice(id: widget.category['id'], type: 2, deleteId: widget.category['id'],),);
            },
            backgroundColor: Color1.white,
            foregroundColor: const Color(0xFFFE4A49),
            icon: Icons.percent_outlined,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        key: const ValueKey(0),
        children: [
          SlidableAction(
            key: const ValueKey(0),
            onPressed: (context) {
              showDialog(context: context, builder: (context) => EditAlert(id: widget.category['id'], last: widget.category['type'], cat: true, ),);
            },
            backgroundColor: Color1.white,
            foregroundColor: Color1.black,
            icon: Icons.edit,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SectionAdminView(catId: widget.category['id'], catName: widget.category['type'],),
          ));
        },
        child: Container(
          height: height * 0.05,
          width: width,
          margin: EdgeInsets.all(height * 0.022),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.black54, width: 0.4),
          )),
          child: SizedBox(
            width: width / 2.2,
            child: Text(
              widget.category['type'],
              style: const TextStyle(
                  letterSpacing: 0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
