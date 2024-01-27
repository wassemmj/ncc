import 'package:http/http.dart' as http;
import 'package:ncc_app/core/api.dart';

import '../../core/token.dart';

class UsersApi {
  static Future getAllUser() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/users/show'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('The response is Empty');
        }
        return response.body;
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future findUser(int userID) async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/user/show/$userID'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('The response is Empty');
        }
        return response.body;
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future makeAdmin(int userID) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/user/$userID/MakeAdmin'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('The response is Empty');
        }
        return response.body;
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }
}
