import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ncc_app/views/admin/awidget/discount_choice.dart';

import '../../../../core/color1.dart';
import '../../../../core/style.dart';
import '../../../../logic/delete_cubit/delete_cubit.dart';
import '../../awidget/discount_body.dart';
import '../../awidget/edit_alert.dart';
import '../../products_admin_view/products_admin_view.dart';

class SectorsAdminWidget extends StatelessWidget {
  const SectorsAdminWidget({Key? key, required this.sectors}) : super(key: key);

  final List sectors;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: sectors.length,
      physics: const RangeMaintainingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            key: const ValueKey(0),
            children: [
              BlocListener<DeleteCubit, DeleteState>(
                listener: (context, state) {
                  if(state.status == DeleteStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sector Deleted Successfully')));
                  }
                },
                child: SlidableAction(
                  key: const ValueKey(0),
                  onPressed: (context)  async {
                    await BlocProvider.of<DeleteCubit>(context)
                        .deleteSector(sectors[index]['id']);
                  },
                  backgroundColor: Color1.white,
                  foregroundColor: const Color(0xFFFE4A49),
                  icon: Icons.delete,
                ),
              ),
              SlidableAction(
                key: const ValueKey(0),
                onPressed: (context) {
                  showDialog(context: context, builder: (context) => DiscountChoice(id: sectors[index]['id'], type: 4, deleteId: sectors[index]['id'],),);
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
                  showDialog(context: context, builder: (context) => EditAlert(id: sectors[index]['id'],last: sectors[index]['name'], cat: false,),);

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
                builder: (context) => ProductsAdminView(
                    name: sectors[index]['name'], sectorID: sectors[index]['id'],),
              ));
            },
            child: Container(
              width:  width,
              decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.04),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              child: Text(
                sectors[index]['name'],
                maxLines: 2,
                style: Style.textStyle17,
              ),
            ),
          ),
        );
      },
    );
  }
}
