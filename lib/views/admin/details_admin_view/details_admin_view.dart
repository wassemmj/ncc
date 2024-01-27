import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/views/admin/details_admin_view/widget/details_admin_advert.dart';

import '../../../logic/details_cubit/details_cubit.dart';
import '../../awidget/loading_widget.dart';
import '../../details_view/widget/build_images.dart';

class DetailsAdminView extends StatefulWidget {
  const DetailsAdminView({Key? key, required this.productId}) : super(key: key);

  final int productId;

  @override
  State<DetailsAdminView> createState() => _DetailsAdminViewState();
}

class _DetailsAdminViewState extends State<DetailsAdminView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<DetailsCubit>(context, listen: false)
          .getDetails(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state.status == DetailsStatus.initial ||
              state.status == DetailsStatus.loading) {
            return const LoadingWidget();
          } else if (BlocProvider.of<DetailsCubit>(context).details == null) {
            return const LoadingWidget();
          }
          var details =
              BlocProvider.of<DetailsCubit>(context).details['products'];
          var image = details[0]['images'];
          List images = [];
          images.add(details[0]['image']);
          for (int i = 0; i < image.length; i++) {
            images.add(image[i]['name']);
          }
          var detailss;
          if (details[0].containsKey('monitor_details') && details[0]['monitor_details'].isNotEmpty) {
            detailss = details[0]['monitor_details'];
          }
          else if (details[0].containsKey('details') && details[0]['details'].isNotEmpty) {
            detailss = details[0]['details'];
          }
          var discounts = details[0]['discounts'];
          return SafeArea(
            child: SingleChildScrollView(
              physics: const RangeMaintainingScrollPhysics(),
              child: Container(
                color: Colors.black54.withOpacity(0.03),
                child: Column(
                  children: [
                    BuildImages(
                      images: images,
                      type: details[0]['Type'],
                    ),
                    DetailsAdminAdvert(
                      ava: details[0]['Availabilty'],
                      code: details[0]['product_code'],
                      price: details[0]['price'],
                      name: details[0]['name'],
                      discountPrice: discounts.isNotEmpty ? discounts[0]['percentage_off'] : 0,
                      discount: discounts.isNotEmpty,
                      brand: details[0]['Brand'],
                      description: details[0]['desc'],
                      id: details[0]['id'],
                      more: details[0].containsKey('monitor_details') && details[0]['monitor_details'].isNotEmpty ||
                          details[0].containsKey('details') && details[0]['details'].isNotEmpty,
                      moreDetails: details[0].containsKey('monitor_details') && details[0]['monitor_details'].isNotEmpty
                          ? detailss[0]
                          : details[0].containsKey('details') && details[0]['details'].isNotEmpty
                          ? detailss[0]
                          : {},
                      discountId: details[0]['discounts'].isNotEmpty
                          ? discounts[0]['id']
                          : 0,
                      quantity: details[0]['Quntity'],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
