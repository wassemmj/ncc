import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/fav_cubit/fav_cubit.dart';

class FavButton extends StatefulWidget {
  const FavButton({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool fav = false;

  @override
  void initState() {
    super.initState();
    getd();
  }

  getd() async {
    var f = BlocProvider.of<FavCubit>(context);
    // await f.getFav();
    fav = f.fav['message'].any((product) {
      return widget.id == product['id'];
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (fav) {
      fav = true;
    } else {
      fav = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return Container(
          width: (height / 21.68),
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.03),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () async {
              if (!fav) {
                await BlocProvider.of<FavCubit>(context).makeFav(widget.id);
              } else {
                await BlocProvider.of<FavCubit>(context).makeFav(widget.id);
                setState(() {
                  fav = false;
                });
              }
              await BlocProvider.of<FavCubit>(context).getFav();
              getd();
            },
            icon: Icon(
              fav ? Icons.favorite : Icons.favorite_border,
              color: fav ? Colors.red : Colors.black,
              size: (height / 39.42),
            ),
          ),
        );
      },
    );
  }
}
