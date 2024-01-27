import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class OrderUserApi {
  static Future checkOut(String number,String location) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/product/checkOut'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
          body: {
            'phone_number': number,
            'shipping_address': location
          }
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('The Body is Empty');
        }
        return response.body;
      } else {
        throw Exception('Error Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getLastOrder() async {
    try {
      var response = await http.get(
          Uri.parse('${Api.api}/product/getMyorder'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('The Body is Empty');
        }
        return response.body;
      } else {
        throw Exception('Error Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getOrderByStatus(String status) async {
    try {
      var response = await http.get(
          Uri.parse('${Api.api}/product/getProductByHereStutas/$status'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('The Body is Empty');
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