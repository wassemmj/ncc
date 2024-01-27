import 'dart:convert';

import 'package:ncc_app/data/api/home_api.dart';

class HomeRepo {
  static Future getDiscountProduct(String sort) async {
    try {
      var response = await HomeApi.getDiscountProduct(sort);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occured');
    }
  }

  static Future getNewProduct(String sort) async {
    try {
      var response = await HomeApi.getNewProduct(sort);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occured');
    }
  }

  static Future getUsedProduct(String sort) async {
    try {
      var response = await HomeApi.getUsedLaptop(sort);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occured');
    }
  }

  static Future search(String word) async {
    try {
      var response = await HomeApi.search(word);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error occured');
    }
  }
}