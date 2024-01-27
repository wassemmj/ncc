import 'dart:convert';

import 'package:ncc_app/data/api/order_user_api.dart';

class OrderUserRepo {
  static Future checkOut(String number,String location) async {
    try {
      var response = await OrderUserApi.checkOut(number, location);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error Occurred');
    }
  }

  static Future getLastOrder() async {
    try {
      var response = await OrderUserApi.getLastOrder();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error Occurred');
    }
  }
  static Future getOrderByStatus(String status) async {
    try {
      var response = await OrderUserApi.getOrderByStatus(status);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error Occurred');
    }
  }
}