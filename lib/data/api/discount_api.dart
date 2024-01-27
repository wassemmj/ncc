import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class DiscountApi {
  static Future makeDiscountProduct(int productId,int percentageOff,int type) async {
    try {
      var response;
      if(type == 1) {
        response = await http.post(
            Uri.parse('${Api.api}/category/Section/product/$productId/makeDiscount'),
            headers: {
              'Accept': 'application/json',
              'Connection': "Keep-Alive",
              'Authorization': 'Bearer ${Token.token}'
            },
            body: {
              'percentage_off' : '$percentageOff'
            }
        );
        print(1);
      } else if(type == 2) {
        response = await http.post(
            Uri.parse('${Api.api}/category/Section/product/$productId/makeDiscountOnCategory'),
            headers: {
              'Accept': 'application/json',
              'Connection': "Keep-Alive",
              'Authorization': 'Bearer ${Token.token}'
            },
            body: {
              'percentage_off' : '$percentageOff'
            }
        );
        print(2);
      } else if(type == 3) {
        response = await http.post(
            Uri.parse('${Api.api}/category/Section/product/$productId/makeDiscountOnSection'),
            headers: {
              'Accept': 'application/json',
              'Connection': "Keep-Alive",
              'Authorization': 'Bearer ${Token.token}'
            },
            body: {
              'percentage_off' : '$percentageOff'
            }
        );
        print(3);
      } else if (type == 4) {
        response = await http.post(
            Uri.parse('${Api.api}/category/Section/product/$productId/makeOnSectorDiscount'),
            headers: {
              'Accept': 'application/json',
              'Connection': "Keep-Alive",
              'Authorization': 'Bearer ${Token.token}'
            },
            body: {
              'percentage_off' : '$percentageOff'
            }
        );
        print(4);
      } else {
        response = await http.post(
            Uri.parse('${Api.api}/category/Section/product/makeDisForAllProduct'),
            headers: {
              'Accept': 'application/json',
              'Connection': "Keep-Alive",
              'Authorization': 'Bearer ${Token.token}'
            },
            body: {
              'percentage_off' : '$percentageOff'
            }
        );
        print(5);
      }
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

  static Future deleteDiscountProduct(int productId,int type) async {
    try {
      var response;
      if(type == 1) {
        response = await http.post(
            Uri.parse('${Api.api}/category/Section/product/$productId/DeleteDiscount'),
            headers: {
              'Accept': 'application/json',
              'Connection': "Keep-Alive",
              'Authorization': 'Bearer ${Token.token}'
            },
        );
        print(1);
      } else if(type == 2) {
        response = await http.post(
            Uri.parse('${Api.api}/category/Section/product/$productId/DeleteDiscountOnCategory'),
            headers: {
              'Accept': 'application/json',
              'Connection': "Keep-Alive",
              'Authorization': 'Bearer ${Token.token}'
            },
        );
        print(2);
      } else if(type == 3) {
        response = await http.post(
            Uri.parse('${Api.api}/category/Section/product/$productId/DeleteDiscountOnSection'),
            headers: {
              'Accept': 'application/json',
              'Connection': "Keep-Alive",
              'Authorization': 'Bearer ${Token.token}'
            },
        );
        print(3);
      } else if (type == 4) {
        response = await http.post(
            Uri.parse('${Api.api}/category/Section/product/$productId/DeleteDiscountOnSector'),
            headers: {
              'Accept': 'application/json',
              'Connection': "Keep-Alive",
              'Authorization': 'Bearer ${Token.token}'
            },
        );
        print(4);
      }
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