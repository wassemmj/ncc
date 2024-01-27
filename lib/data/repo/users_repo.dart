import 'dart:convert';

import 'package:ncc_app/data/api/users_api.dart';

class UsersRepo {
  static Future getAllUser() async {
    try {
      var response = await UsersApi.getAllUser();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future findUser(int userId) async {
    try {
      var response = await UsersApi.findUser(userId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future makeAdmin(int userId) async {
    try {
      var response = await UsersApi.makeAdmin(userId);

      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }
}