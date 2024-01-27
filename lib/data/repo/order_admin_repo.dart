import 'dart:convert';

import 'package:ncc_app/data/api/order_admin_api.dart';

class OrderAdminRepo {
  static Future getAllOrder() async {
    try {
      var response = await OrderAdminApi.getAllOrder();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occurred in repo');
    }
  }

  static Future getInStockOrder() async {
    try {
      var response = await OrderAdminApi.getInStockOrder();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occurred in repo');
    }
  }

  static Future getOnWayOrder() async {
    try {
      var response = await OrderAdminApi.getOnWayOrder();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occurred in repo');
    }
  }

  static Future getArrived() async {
    try {
      var response = await OrderAdminApi.getArrived();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occurred in repo');
    }
  }
}