import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/api.dart';
import '../../../../core/color1.dart';
import '../../../../logic/add_cubit/add_cubit.dart';
import '../../../home_view/widget/advert_nav.dart';

class AdvertAdminWidget extends StatelessWidget {
  const AdvertAdminWidget({Key? key, required this.image, required this.type, required this.id})
      : super(key: key);

  final String image;
  final String type;
  final int id;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        key: const ValueKey(0),
        children: [
          BlocListener<AddCubit, AddState>(
            listener: (context, state) {},
            child: SlidableAction(
              key: const ValueKey(0),
              onPressed: (context) async {
                await BlocProvider.of<AddCubit>(context).deleteAdd(id);
              },
              backgroundColor: Color1.white,
              foregroundColor: const Color(0xFFFE4A49),
              icon: Icons.delete,
            ),
          ),
        ],
      ),
      child: Container(
        height: height * 0.17,
        margin: const EdgeInsets.all(5),
        child: Stack(
          children: [
            Container(
              width: width - 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '${Api.apiImage}/adv/$image',
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdvertNav(type: type),));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
                  backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
                ),
                child: const Text(
                  'Shop now',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
