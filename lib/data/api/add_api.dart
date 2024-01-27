import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class AddApi {
  static Future getAdd() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/ads/getAdds'),
        headers: {
          'Accept': 'application/json',
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

  static Future makeAdd(File image,String type) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.token}',
      };
      var request = http.MultipartRequest('POST', Uri.parse('${Api.api}/ads/makeAdds'));
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      request.headers.addAll(headers);
      request.fields.addAll({
        'type': type
      });
      http.StreamedResponse response = await request.send();
      if(response.statusCode == 200) {
        return response.stream.bytesToString();
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future editAdd(int id,File image,String type) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.token}',
      };
      var request = http.MultipartRequest('POST', Uri.parse('${Api.api}/ads/editAdds/$id'));
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      request.headers.addAll(headers);
      request.fields.addAll({
        'type': type
      });
      http.StreamedResponse response = await request.send();
      if(response.statusCode == 200) {
        return response.stream.bytesToString();
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteAdd(int id) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/ads/deleteAdds/$id'),
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