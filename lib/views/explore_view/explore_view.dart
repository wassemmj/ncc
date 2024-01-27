import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/cat_cubit/cat_cubit.dart';
import 'package:ncc_app/views/awidget/loading_widget.dart';
import 'package:ncc_app/views/explore_view/widget/category_widget.dart';
import 'package:ncc_app/views/explore_view/widget/section_widget.dart';


class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<CatCubit>(context).getCat();
      var c = BlocProvider.of<CatCubit>(context).category['category'][0];
      await BlocProvider.of<CatCubit>(context).getSec(c['id'],'desc');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        child: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            if( BlocProvider.of<CatCubit>(context).category == null) {
              return const LoadingWidget();
            }
            var category = BlocProvider.of<CatCubit>(context).category['category'];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CategoryWidget(
                  set: (index) async{
                    setState(() => currentIndex = index);
                    await BlocProvider.of<CatCubit>(context).getSec(category[currentIndex]['id'],'desc');
                  },
                  currentIndex: currentIndex,
                  category: category,
                ),
                SectionWidget(catId: category[currentIndex]['id'],),
              ],
            );
          },
        ),
      ),
    );
  }
}
