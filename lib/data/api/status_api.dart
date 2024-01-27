import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class StatusApi {
  static Future acceptOrder(int id) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/product/AcceptOrder/$id'),
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

  static Future rejectOrder(int id) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/product/RejectOrder/$id'),
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

  static Future changeStatus(int id,String location) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/product/order/edit/$id'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
          body: {
            'location' : location
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
}