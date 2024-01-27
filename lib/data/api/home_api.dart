import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class HomeApi {
  static Future getNewProduct(String sort) async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/category/NewProduct/$sort'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('is Empty');
        }
        return response.body;
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getDiscountProduct(String sort) async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/category/DiscountProduct/$sort'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('is Empty');
        }
        return response.body;
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future search(String word) async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/sreach/$word'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('is Empty');
        }
        return response.body;
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getUsedLaptop(String sort) async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/category/UsedProduct/$sort'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('is Empty');
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