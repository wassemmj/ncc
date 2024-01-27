import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/color1.dart';
import '../../core/style.dart';
import '../../logic/home_cubit/home_cubit.dart';
import '../fav_view/widget/fav_widget.dart';


class Result extends StatefulWidget {
  const Result({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List li = [];
  var m = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<HomeCubit>(context, listen: false)
          .search(widget.query);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if ((state.status == HomeStatus.loading ||
            state.status == HomeStatus.initial)) {
          return Container(
            alignment: Alignment.center,
            height: height,
            child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ),
          );
        }
        if (BlocProvider.of<HomeCubit>(context).searchList == null) {
          return Container(
            alignment: Alignment.center,
            height: height,
            child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ),
          );
        }
        li = BlocProvider.of<HomeCubit>(context).searchList['result'];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: li.isNotEmpty ? ListView.builder(
            itemCount: li.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return FavWidget(
                  image: li[index]['image'],
                  name: li[index]['name'],
                  price: li[index]['final_price'].toString(),
                  id: li[index]['id'],
                  brand: li[index]['Brand']);
            },
          ) : const Center(
            child: Text(
              'There isn\'t any result here',
              textAlign: TextAlign.center,
              style: Style.textStyle18,
            ),
          ),
        );
      },
    );
  }
}
