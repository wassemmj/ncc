import 'dart:convert';

import 'package:ncc_app/data/api/discount_api.dart';

class DiscountRepo {
  static Future makeDiscountProduct(int productId,int percentageOff , int type) async {
    try {
      var response = await DiscountApi.makeDiscountProduct(productId, percentageOff,type);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future deleteDiscountProduct(int productId, int type) async {
    try {
      var response = await DiscountApi.deleteDiscountProduct(productId,type);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }
}