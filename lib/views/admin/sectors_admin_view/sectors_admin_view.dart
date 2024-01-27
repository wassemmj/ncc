import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/create_sector/create_sector.dart';
import 'package:ncc_app/views/admin/sectors_admin_view/widget/sectors_admin_widget.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';

import '../../../core/color1.dart';
import '../../../logic/cat_cubit/cat_cubit.dart';
import '../../nav_view/widget/appbar_icon.dart';
import '../products_admin_view/widget/product_admin_out.dart';

class SectorsAdminView extends StatefulWidget {
  const SectorsAdminView({Key? key, required this.secId, required this.name})
      : super(key: key);

  final int secId;
  final String name;

  @override
  State<SectorsAdminView> createState() => _SectorsAdminViewState();
}

class _SectorsAdminViewState extends State<SectorsAdminView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<CatCubit>(context).getSector(widget.secId, 'desc');
    });
    super.initState();
  }

  int pageIndex = 0;

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
        actions: [
          AppbarIcon(
            icon: Icons.add,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateSector(),
              ));
            },
            color: Colors.black54.withOpacity(0.03),
          ),
          SizedBox(width: (width / 82)),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            if (state.status == CatStatus.loading ||
                state.status == CatStatus.initial) {
              return const LoadingWidget();
            }
            if (BlocProvider.of<CatCubit>(context).sectors == null) {
              return const LoadingWidget();
            }
            Map sector = BlocProvider.of<CatCubit>(context).sectors;
            if (sector.containsKey('sector')) {
              var sectors =
                  BlocProvider.of<CatCubit>(context).sectors['sector'];
              return SectorsAdminWidget(sectors: sectors);
            }
            var pageUrl = sector['products']['links'];
            return ProductsAdminOut(
              pageIndex: pageIndex,
              product: sector,
              onPressed: (index) async {
                setState(() {
                  pageIndex = index;
                });
                await BlocProvider.of<CatCubit>(context)
                    .api(pageUrl[index + 1]['url']);
              },
            );
          },
        ),
      ),
    );
  }
}
