import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color1.dart';

abstract class Style {
  static var   textStyle32 = GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: Colors.orange,
    ),
  );

  static const  textStyle30 = TextStyle(
    color: Color1.black,
    fontSize: 30,
    fontWeight: FontWeight.w800,
  );
  static const  textStyle24 = TextStyle(
    color: Color1.black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ); static const  textStyle20 = TextStyle(
    color: Color1.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static var   textStyle23 = TextStyle(
    color: Color1.black.withOpacity(0.9),
    fontSize: 23,
    fontWeight: FontWeight.w600,
  );

  static const textStyle22 = TextStyle(
      color: Color1.black,
      fontSize: 22,
      letterSpacing: 1,
      fontWeight: FontWeight.w600
  );

  static TextStyle textStyleSec = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Color1.primaryColor,
  );

  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static const textStyle17 = TextStyle(
    color: Color1.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const textStyle14 = TextStyle(
      color: Colors.black54,
      fontSize: 14,
      fontWeight: FontWeight.w400);

}