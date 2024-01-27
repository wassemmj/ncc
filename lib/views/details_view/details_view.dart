import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/details_cubit/details_cubit.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';
import 'package:ncc_app/views/details_view/widget/build_images.dart';
import 'package:ncc_app/views/details_view/widget/details_advert.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key, required this.productId}) : super(key: key);

  final int productId;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
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
                    DetailsAdvert(
                      ava: details[0]['Availabilty'],
                      code: details[0]['product_code'],
                      price: details[0]['price'],
                      name: details[0]['name'],
                      discountPrice: details[0]['discounts'],
                      discount: details[0]['discounts'].isNotEmpty,
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
