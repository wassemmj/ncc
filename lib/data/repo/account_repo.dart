import 'dart:convert';

import 'package:ncc_app/data/api/account_api.dart';

class AccountRepo {

  static Future getAccount() async {
    try {
       var response = await AccountApi.getAccount();
       return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future updateAccount(String name,String email, String address) async {
    try {
      var response = await AccountApi.updateAccount(name, email, address);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }

}