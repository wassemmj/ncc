import 'package:http/http.dart' as http;

import '../../core/api.dart';
import '../../core/token.dart';

class NotificationApi {
  static Future getNotification() async {
    try {
      var response = await http.get(
        Uri.parse('${Api.api}/getNotifications'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
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

  static Future markAsRead(String id) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/markAsRead/$id'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
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

  static Future deleteNotification(String id) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.api}/deleteNotification/$id'),
        headers: {
          'Accept': 'application/json',
          'Connection': "Keep-Alive",
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      print(response.body) ;
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