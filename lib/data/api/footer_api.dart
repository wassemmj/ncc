import 'package:http/http.dart' as http;
import 'package:ncc_app/core/api.dart';

import '../../core/token.dart';

class FooterApi {
  static Future getFooter() async {
    try {
      var response =
          await http.get(Uri.parse('${Api.api}/footer/getInfo'), headers: {
        'Accept': 'application/json',
        'Connection': "Keep-Alive",
        'Authorization': 'Bearer ${Token.token}'
      });
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
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
      var response = await http.post(
        Uri.parse('${Api.api}/footer/makeInfo'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
        body: {
          'email' : email,
          'address' : address,
          'description' : description,
          'numberOne' : numbers[0],
          'numberTwo' : numbers[1],
          'numberThree' : numbers[2],
          'faceBook_Account' : fAccount,
          'instagram_Account' : iAccount,
          'twitter_Account' : tAccount,
        }
      );
      print(response.body);
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
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
      var response = await http.post(
          Uri.parse('${Api.api}/footer/edit/$id'),
          headers: {
            'Accept': 'application/json',
            'Connection': "Keep-Alive",
            'Authorization': 'Bearer ${Token.token}'
          },
          body: {
            'email' : email,
            'address' : address,
            'description' : description,
            'numberOne' : numbers[0],
            'numberTwo' : numbers[1],
            'numberThree' : numbers[2],
            'faceBook_Account' : fAccount,
            'instagram_Account' : iAccount,
            'twitter_Account' : tAccount,
          }
      );
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
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

  static Future deleteFooter(int id) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/footer/delete/$id'),
          headers: {
            'Accept': 'application/json',
            'Connection': "Keep-Alive",
            'Authorization': 'Bearer ${Token.token}'
          },
      );
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
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
