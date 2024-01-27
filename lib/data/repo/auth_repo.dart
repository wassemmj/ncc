import 'dart:convert';

import 'package:ncc_app/data/api/auth_api.dart';
import 'package:ncc_app/data/models/auth_model.dart';

class AuthRepo {
  static Future register(AuthModel authModel) async {
    try {
      var response = await AuthApi.register(authModel);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an error occured');
    }
  }

  static Future login(AuthModel authModel) async {
    try {
      var response = await AuthApi.login(authModel);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an error occured');
    }
  }

  static Future logout() async {
    try {
      var response = await AuthApi.logout();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('an error occured');
    }
  }
}