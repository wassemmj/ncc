import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class CartApi {
  static Future addToCart(int productId, int quantity) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/product/addToCart'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
          body: {
            'Quntity': '$quantity',
            'product_id': '$productId',
          }
      );
      print(response.body);
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
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

  static Future showCart() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/product/CartItems'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
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

  static Future deleteItem(int id) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/product/deleteItmeFromCart'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
          body: {
            'cart_item_id': '$id',
          }
      );
      print(response.body);
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
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

  static Future deleteOneItem(int id) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/product/deleteOneItmeFromCart'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
          body: {
            'cart_item_id': '$id',
          }
      );
      print(response.body);
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
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