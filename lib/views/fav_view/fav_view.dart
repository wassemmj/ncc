import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:ncc_app/views/awidget/fav_button.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';
import 'package:ncc_app/views/fav_view/widget/fav_widget.dart';

import '../../core/color1.dart';
import '../../core/style.dart';
import '../../logic/fav_cubit/fav_cubit.dart';
import '../nav_view/widget/appbar_icon.dart';

class FavView extends StatefulWidget {
  const FavView({Key? key}) : super(key: key);

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<FavCubit>(context, listen: false).getFav();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(height * 0.008),
          child: AppbarIcon(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.of(context).pop(), color: Colors.black54.withOpacity(0.03),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Favorites',
          style: Style.textStyle23,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            if (BlocProvider.of<FavCubit>(context).fav == null) {
              return const LoadingWidget();
            }
            var fav = BlocProvider.of<FavCubit>(context).fav['message'];
            return Container(
              padding: EdgeInsets.all(height * 0.02),
              child: fav.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: fav.length,
                      itemBuilder: (context, index) {
                        var id = fav[index]['pivot'];
                        return FavWidget(
                            image: fav[index]['image'],
                            name: fav[index]['name'],
                            price: fav[index]['price'],
                            id: fav[index]['id'],
                            brand: fav[index]['Brand']);
                      },
                    )
                  : const Center(
                      child: Text(
                        'There is not any favorites Products,\n Add Some Products',
                        textAlign: TextAlign.center,
                        style: Style.textStyle18,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
