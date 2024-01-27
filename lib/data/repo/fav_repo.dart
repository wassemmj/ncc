import 'dart:convert';

import 'package:ncc_app/data/api/fav_api.dart';

class FavRepo {
  static Future makeFav(int productId) async {
    try {
      var response = await FavApi.makeFav(productId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occured');
    }
  }

  static Future getFav() async {
    try {
      var response = await FavApi.getFav();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occured');
    }
  }
}