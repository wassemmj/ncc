import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class ColorApi {
  static Future getColor() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/colorGet'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
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

  static Future changeColor(int R, int G, int B, double A) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/updateColor'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
        body: {
          'R' : '$R',
          'G' : '$G',
          'B' : '$B',
          'A' : '$A',
        },
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
}
