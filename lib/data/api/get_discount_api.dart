import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class GetDiscountApi {
  static Future getDiscount() async {
    try {
      var response = await http.get(
          Uri.parse('${Api.api}/category/Section/product/getAllDiscounts'),
          headers: {
            'Accept': 'application/json',
            'Connection': "Keep-Alive",
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

}