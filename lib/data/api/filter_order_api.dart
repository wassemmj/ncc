import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class FilterOrderApi {
  static Future filterArrived() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/ArrivedOrder/filter'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body) ;
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

  static Future filterRejected() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/RejectedOrder/filter'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body) ;
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
