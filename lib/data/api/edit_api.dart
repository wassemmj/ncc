import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class EditApi {
  static Future editCat(int productId,String edit) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/EditCategory/$productId'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
        body: {
          'type' : edit,
        }
      );
      print(response.body);
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

  static Future editSector(int productId,String edit) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/category/Section/$productId/editSector'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
        body: {
          'name' : edit,
        }
      );
      print(response.statusCode);
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

  static Future editSec(String type, File? image, int catId) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.token}'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Api.api}/category/editSection/$catId'));
      if(image == null ) {
        request.fields.addAll({
          'Section_type': type,
          'Section_image' : 'null',
        });
      }
      else {
        request.files
            .add(await http.MultipartFile.fromPath('Section_image', image.path));
        request.headers.addAll(headers);
        request.fields.addAll({
          'Section_type': type,
        });
      }
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.stream.bytesToString();
      } else {
        throw Exception('error occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future editProduct(int id,String price,String quantity,String ava) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/category/Section/product/edit/$id'),
          headers: {
            'Accept': 'application/json',
            'Connection': "Keep-Alive",
            'Authorization': 'Bearer ${Token.token}'
          },
          body: {
            'price' : price,
            'Quntity' : quantity,
            'Availabilty' : ava,
          }
      );
      print(response.statusCode);
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