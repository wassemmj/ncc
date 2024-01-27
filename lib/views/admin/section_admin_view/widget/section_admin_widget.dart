import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ncc_app/views/admin/awidget/discount_choice.dart';
import 'package:ncc_app/views/admin/awidget/edit_section_alert.dart';

import '../../../../core/api.dart';
import '../../../../core/color1.dart';
import '../../../../core/style.dart';
import '../../../../logic/delete_cubit/delete_cubit.dart';
import '../../awidget/discount_body.dart';
import '../../sectors_admin_view/sectors_admin_view.dart';

class SectionAdminWidget extends StatelessWidget {
  const SectionAdminWidget({Key? key, required this.id, required this.name, required this.image}) : super(key: key);

  final int id;
  final String name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SectorsAdminView(
            secId: id,
            name: name,
          ),
        ));
      },
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          key: const ValueKey(0),
          children: [
            BlocListener<DeleteCubit, DeleteState>(
              listener: (context, state) {
                if(state.status == DeleteStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Section Deleted Successfully')));
                }
              },
              child: SlidableAction(
                key: const ValueKey(0),
                onPressed: (context)  async {
                  await BlocProvider.of<DeleteCubit>(context)
                      .deleteSec(id);
                },
                backgroundColor: Color1.white,
                foregroundColor: const Color(0xFFFE4A49),
                icon: Icons.delete,
              ),
            ),
            SlidableAction(
              key: const ValueKey(0),
              onPressed: (context) {
                showDialog(context: context, builder: (context) => DiscountChoice(id: id, type: 3, deleteId: id,),);
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
                showDialog(context: context, builder: (context) => EditSectionAlert(id: id, last: name,pickedImage: image),);
              },
              backgroundColor: Color1.white,
              foregroundColor: Color1.black,
              icon: Icons.edit,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.04),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              image != null ? SizedBox(
                height: height * .1,
                child: Image.network(
                  '${Api.apiImage}/section/$image',
                ),
              ): Container(),
              const SizedBox(width: 8,),
              Text(
                name,
                textAlign: TextAlign.center,
                style: Style.textStyle17,
              )
            ],
          ),
        ),
      ),
    );
  }
}