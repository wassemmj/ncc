import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class OrderAdminApi {
  static Future getAllOrder() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/product/allOrder'),
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

  static Future getInStockOrder() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/product/getInStockOrder'),
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

  static Future getOnWayOrder() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/product/getSippedOrder'),
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

  static Future getArrived() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/product/getArrivedOrder'),
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