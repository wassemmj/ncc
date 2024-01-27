import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/home_cubit/home_cubit.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';
import 'package:ncc_app/views/home_view/widget/home_advert.dart';
import 'package:ncc_app/views/home_view/widget/home_list_product.dart';
import 'package:ncc_app/views/home_view/widget/home_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<HomeCubit>(context, listen: false).getHome('desc');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.initial ||
                state.status == HomeStatus.loading) {
              return const LoadingWidget();
            }
            if (BlocProvider.of<HomeCubit>(context).newProduct == null ||
                BlocProvider.of<HomeCubit>(context).discountProduct == null ||
                // BlocProvider.of<HomeCubit>(context).usedProduct == null ||
                BlocProvider.of<HomeCubit>(context).adds == null) {
              return const LoadingWidget();
            }
            var newProduct = BlocProvider.of<HomeCubit>(context).newProduct;
            var discountProduct =
                BlocProvider.of<HomeCubit>(context).discountProduct;
            // var usedProduct = BlocProvider.of<HomeCubit>(context).usedProduct;
            var adds = BlocProvider.of<HomeCubit>(context).adds['adv'];
            return Container(
              padding: EdgeInsets.only(
                  left: (height * 0.02),
                  top: (height * 0.02),
                  right: (height * 0.02)),
              child: Column(
                children: [
                  HomeAdvert(
                    adv: adds,
                  ),
                  SizedBox(height: height * 0.02),
                  const HomeText(
                    text1: 'New Arrival' ,
                    text2: 'See all' ,
                    type: 'new',
                  ),
                  SizedBox(height: height * 0.015),
                  HomeListProduct(
                    product: newProduct['products'],
                  ),
                  SizedBox(height: height * 0.005),
                  const HomeText(
                    text1: 'Best Seller',
                    text2: 'See all' ,
                    type: 'discount',
                  ),
                  SizedBox(height: height * 0.015),
                  HomeListProduct(
                    product: discountProduct['products'],
                  ),
                  // SizedBox(height: height * 0.005),
                  // const HomeText(
                  //   text1: 'Used Products',
                  //   text2: 'See all',
                  //   type: 'used',
                  // ),
                  // SizedBox(height: height * 0.015),
                  // HomeListProduct(
                  //   product: usedProduct['products'],
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}