import 'dart:convert';

import '../api/filter_order_api.dart';

class FilterOrderRepo {
  static Future filterArrived() async {
    try {
      var response = await FilterOrderApi.filterArrived();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an Error Occured');
    }
  }

  static Future filterRejected() async {
    try {
      var response = await FilterOrderApi.filterRejected();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an Error Occured');
    }
  }
}