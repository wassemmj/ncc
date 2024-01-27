import 'dart:convert';

import 'package:ncc_app/data/api/status_api.dart';

class StatusRepo {


  static Future acceptOrder(int id) async {
    try {
      var response = await StatusApi.acceptOrder(id);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occurred in repo');
    }
  }

  static Future rejectOrder(int id) async {
    try {
      var response = await StatusApi.rejectOrder(id);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occurred in repo');
    }
  }

  static Future changeStatus(int id,String location) async {
    try {
      var response = await StatusApi.changeStatus(id, location);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occurred in repo');
    }
  }
}