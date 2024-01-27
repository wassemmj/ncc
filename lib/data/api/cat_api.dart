import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ncc_app/core/api.dart';
import 'package:ncc_app/core/token.dart';

class CatApi {
  static Future catApi() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/getCategory'),
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

  static Future secApi(int catId,String sort) async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/category/getSection/$catId/$sort'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      // print(jsonDecode(response.body));
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

  static Future sectorApi(int secId,String sort) async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/category/Section/getProductBySection/$secId/$sort'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      // print(sort);
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

  static Future productApi(int sectorId,String sort) async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/category/Section/Sector/getProductBySector/$sectorId/$sort'),
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

  static Future api(String api) async {
    try {
      var response = await http.get(
        Uri.parse(api),
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
        print('done api');
        return response.body;
      } else {
        throw Exception('Exception Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }
}