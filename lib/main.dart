import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc_app/logic/account_cubit/account_cubit.dart';
import 'package:ncc_app/logic/advert_cubit/advert_cubit.dart';
import 'package:ncc_app/logic/auth_cubit/auth_cubit.dart';
import 'package:ncc_app/logic/cart_cubit/cart_cubit.dart';
import 'package:ncc_app/logic/cat_cubit/cat_cubit.dart';
import 'package:ncc_app/logic/color_cubit/color_cubit.dart';
import 'package:ncc_app/logic/create_cubit/create_cubit.dart';
import 'package:ncc_app/logic/delete_cubit/delete_cubit.dart';
import 'package:ncc_app/logic/details_cubit/details_cubit.dart';
import 'package:ncc_app/logic/discount_cubit/discount_cubit.dart';
import 'package:ncc_app/logic/fav_cubit/fav_cubit.dart';
import 'package:ncc_app/logic/filter_order_cubit/filter_order_cubit.dart';
import 'package:ncc_app/logic/footer_cubit/footer_cubit.dart';
import 'package:ncc_app/logic/home_cubit/home_cubit.dart';
import 'package:ncc_app/logic/notification_cubit/notification_cubit.dart';
import 'package:ncc_app/logic/order_user_cubit/order_user_cubit.dart';
import 'package:ncc_app/logic/status_cubit/status_cubit.dart';
import 'package:ncc_app/logic/user_cubit/user_cubit.dart';
import 'package:ncc_app/views/splash_view/splash_view.dart';

import 'core/color1.dart';
import 'logic/add_cubit/add_cubit.dart';
import 'logic/edit_cubit/edit_cubit.dart';
import 'logic/get_discount_cubit/get_discount_cubit.dart';
import 'logic/order_admin_cubit/order_admin_cubit.dart';

void main() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var status = prefs.getBool('isLoggedIn') ?? false;
  // var statys = prefs.getInt('role');
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => CatCubit(),
        ),
        BlocProvider(
          create: (context) => CreateCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => DiscountCubit(),
        ),
        BlocProvider(
          create: (context) => FavCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => AccountCubit(),
        ),
        BlocProvider(
          create: (context) => FooterCubit(),
        ),
        BlocProvider(
          create: (context) => EditCubit(),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => OrderUserCubit(),
        ),
        BlocProvider(
          create: (context) => OrderAdminCubit(),
        ),
        BlocProvider(
          create: (context) => StatusCubit(),
        ),
        BlocProvider(
          create: (context) => AddCubit(),
        ),
        BlocProvider(
          create: (context) => AdvertCubit(),
        ),
        BlocProvider(
          create: (context) => GetDiscountCubit(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(),
        ),
        BlocProvider(
          create: (context) => ColorCubit(),
        ),
        BlocProvider(
          create: (context) => FilterOrderCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // hoverColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          color: Color1.white,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color1.primaryColor, // Your accent color
        ),
        scaffoldBackgroundColor: Color1.white,
      ),
      home: const SplashView(),
    );
  }
}
