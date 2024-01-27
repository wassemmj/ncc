import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class DetailsApi {
  static Future getDetails(int productId) async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/category/section/products/$productId'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('Response is empty');
        }
        return response.body;
      } else {
        throw Exception('Error Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }
}