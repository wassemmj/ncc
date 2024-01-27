import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/adverts_admin/widget/advert_admin_widget.dart';
import 'package:ncc_app/views/admin/create_advert/create_advert.dart';

import '../../../core/color1.dart';
import '../../../core/style.dart';
import '../../../logic/add_cubit/add_cubit.dart';
import '../../nav_view/widget/appbar_icon.dart';

class AdvertsAdmin extends StatefulWidget {
  const AdvertsAdmin({Key? key}) : super(key: key);

  @override
  State<AdvertsAdmin> createState() => _AdvertsAdminState();
}

class _AdvertsAdminState extends State<AdvertsAdmin> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<AddCubit>(context, listen: false).getAdd();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
            padding: EdgeInsets.all((height / 108)),
            child: AppbarIcon(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.black54.withOpacity(0.03),
            )),
        title: Text(
          'Adverts',
          style: Style.textStyle23,
        ),
        actions: [
          AppbarIcon(
            icon: Icons.add,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateAdvert(),
              ));
            },
            color: Colors.black54.withOpacity(0.03),
          ),
          SizedBox(width: (width / 82)),
        ],
      ),
      body: BlocBuilder<AddCubit, AddState>(
        builder: (context, state) {
          if (state.status == AddStatus.initial || state.status == AddStatus.loading) {
            return Container(
              alignment: Alignment.center,
              height: height,
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ),
            );
          }
          if (BlocProvider.of<AddCubit>(context).adds == null) {
            return Container(
              alignment: Alignment.center,
              height: height,
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ),
            );
          }
          var adds = BlocProvider.of<AddCubit>(context).adds['adv'];
          return Padding(
            padding: EdgeInsets.all((height * .03)),
            child: ListView.builder(
              itemCount: adds.length,
              physics: const RangeMaintainingScrollPhysics(),
              itemBuilder: (context, index) {
                return AdvertAdminWidget(image: adds[index]['image'], type: adds[index]['type'], id: adds[index]['id'],);
              },
            ),
          );
        },
      ),
    );
  }
}
