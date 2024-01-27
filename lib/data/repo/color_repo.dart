import 'dart:convert';

import 'package:ncc_app/data/api/color_api.dart';

class ColorRepo {
  static Future getColor() async {
    try {
      var response = await ColorApi.getColor();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an error occured');
    }
  }

  static Future changeColor(int R, int G, int B, double A)  async {
    try {
      var response = await ColorApi.changeColor(R, G, B, A);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an error occured');
    }
  }
}