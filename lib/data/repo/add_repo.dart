import 'dart:convert';
import 'dart:io';

import 'package:ncc_app/data/api/add_api.dart';

class AddRepo {
  static Future getAdd() async {
    try {
      var response = await AddApi.getAdd();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Exception occurred');
    }
  }

  static Future makeAdd(File image,String type) async {
    try {
      var response = await AddApi.makeAdd(image, type);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Exception occurred');
    }
  }

  static Future editAdd(int id,File image,String type) async {
    try {
      var response = await AddApi.editAdd(id, image, type);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Exception occurred');
    }
  }

  static Future deleteAdd(int id) async {
    try {
      var response = await AddApi.deleteAdd(id);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Exception occurred');
    }
  }
}