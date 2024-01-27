import 'package:http/http.dart' as http;
import 'package:ncc_app/core/api.dart';

import '../../core/token.dart';
import '../models/auth_model.dart';

class AuthApi {
  static Future register(AuthModel authModel) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/register'),
        headers: {
          'Accept': 'application/json'
        },
        body: authModel.toJson(),
      );
      print(response.body) ;
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        return response.body;
      } else {
        throw Exception('an error occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future login(AuthModel authModel) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/login'),
        headers: {
          'Accept': 'application/json'
        },
        body: authModel.toJson(),
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        return response.body;
      } else {
        throw Exception('an error occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future logout() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        return response.body;
      } else {
        throw Exception('an error occurred');
      }
    } catch (e) {
      rethrow;
    }
  }
}