import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ncc_app/views/admin/user_view/user_view/use_view.dart';

import '../../../../core/color1.dart';
import '../../../../core/style.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key, required this.email, required this.name, required this.role, required this.userId}) : super(key: key);

  final String email;
  final String name;
  final int role;
  final int userId;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        key: const ValueKey(0),
        children:  [
          SlidableAction(
            key: const ValueKey(0),
            onPressed: (context){
            },
            backgroundColor: Color1.white,
            foregroundColor: const Color(0xFFFE4A49),
            icon: Icons.delete,
          ),
        ],
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UseView(userId: userId),)),
        child: Container(
          height: height * 0.12,
          margin: EdgeInsets.all(height * 0.022),
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black54, width: 0.2),
              )),
          child: Row(
            children: [
              Container(
                width: width * 0.3,
                height: height * 0.10,
                decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        image: AssetImage(
                          'image/user.png',
                        ),
                        fit: BoxFit.fitHeight)),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: width / 2.2,
                    child: Text(
                      email,
                      style: const TextStyle(
                          letterSpacing: 0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    name,
                    style: Style.textStyle14,
                  ),
                  role == 2 ? Text(
                    role == 1 ?  'Admin' : 'User',
                    style: Style.textStyle17,
                  ) : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
