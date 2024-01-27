import 'dart:convert';

import 'package:ncc_app/data/api/details_api.dart';

class DetailsRepo {
  static Future getDetails(int productId) async {
    try {
      var response = await DetailsApi.getDetails(productId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('error in repo');
    }
  }
}