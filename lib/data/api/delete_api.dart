import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class DeleteApi {

  static Future deleteCat(int catId) async {
    try {
      var response = await http.delete(
          Uri.parse('${Api.api}/deleteCategory/$catId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('Response is Empty');
        }
        return response.body;
      } else {
        throw Exception('Exception Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteSec(int secId) async {
    try {
      var response = await http.delete(
          Uri.parse('${Api.api}/category/deleteSection/$secId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('Response is Empty');
        }
        return response.body;
      } else {
        throw Exception('Exception Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteSector(int secId) async {
    try {
      var response = await http.delete(
          Uri.parse('${Api.api}/category/Section/$secId/deleteSectoe'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('Response is Empty');
        }
        return response.body;
      } else {
        throw Exception('Exception Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteProduct(int productId) async {
    try {
      var response = await http.delete(
          Uri.parse('${Api.api}/category/Section/product/delete/$productId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('Response is Empty');
        }
        return response.body;
      } else {
        throw Exception('Exception Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

}