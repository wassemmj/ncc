import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/core/style.dart';

import '../../../core/color1.dart';
import '../../../logic/color_cubit/color_cubit.dart';
import '../../auth_view/login_view.dart';

class Splash_View_Body extends StatefulWidget {
  const Splash_View_Body({super.key});

  @override
  Splash_View_BodyState createState() => Splash_View_BodyState();
}

class Splash_View_BodyState extends State<Splash_View_Body>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginView(),
    ));
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ColorCubit>(context, listen: false).getColor();
    });
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<ColorCubit, ColorState>(
        builder: (context, state) {
          if (state.status == ColorStatus.success) {
            var color = BlocProvider.of<ColorCubit>(context).color['colors'][0];
            Color1.primaryColor = Color.fromRGBO(
                color['R'], color['G'], color['B'], (double.parse(color['A'])));
          }
          return Padding(
            padding: EdgeInsets.only(bottom: height / 3.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'image/logo.jpg',
                      opacity: animation,
                      width: 200,
                      height: 200,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Napoli Trading Company',
                        style: Style.textStyle18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
