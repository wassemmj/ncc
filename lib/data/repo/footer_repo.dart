import 'dart:convert';

import 'package:ncc_app/data/api/footer_api.dart';

class FooterRepo {
  static Future getFooter() async {
    try {
      var response = await FooterApi.getFooter();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an Error Occured');
    }
  }

  static Future addFooter(
      String email,
      String address,
      String description,
      List numbers,
      String fAccount,
      String iAccount,
      String tAccount,
      ) async {
    try {
      var response = await FooterApi.addFooter(email, address, description, numbers, fAccount, iAccount, tAccount);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an Error Occured');
    }
  }

  static Future editFooter(
      int id,
      String email,
      String address,
      String description,
      List numbers,
      String fAccount,
      String iAccount,
      String tAccount,
      ) async {
    try {
      var response = await FooterApi.editFooter(id, email, address, description, numbers, fAccount, iAccount, tAccount);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an Error Occured');
    }
  }

  static Future deleteFooter(int id) async {
    try {
      var response = await FooterApi.deleteFooter(id);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Error Occurred');
    }
  }
}