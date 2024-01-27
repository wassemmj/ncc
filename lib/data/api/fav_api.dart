import 'package:http/http.dart' as http;
import 'package:ncc_app/core/api.dart';

import '../../core/token.dart';

class FavApi {
  static Future makeFav(int productId) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/category/section/MakeFavproduct/$productId'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
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

  static Future getFav() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/category/section/getFavproduct'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
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
