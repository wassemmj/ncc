import 'dart:convert';

import 'package:ncc_app/data/api/get_discount_api.dart';

class GetDiscountRepo {
  static Future getDiscount() async {
    try {
      var response = await GetDiscountApi.getDiscount();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occured');
    }
  }
}