import 'dart:convert';

import 'package:ncc_app/data/api/delete_api.dart';

class DeleteRepo {
  static Future deleteCat(int catId) async {
    try {
      var response = await DeleteApi.deleteCat(catId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future deleteSec(int secId) async {
    try {
      var response = await DeleteApi.deleteSec(secId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future deleteSector(int secId) async {
    try {
      var response = await DeleteApi.deleteSector(secId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future deleteProduct(int productId) async {
    try {
      var response = await DeleteApi.deleteProduct(productId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }
}