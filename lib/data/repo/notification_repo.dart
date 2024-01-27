import 'dart:convert';

import 'package:ncc_app/data/api/notification_api.dart';

class NotificationRepo {
  static Future getNotification() async {
    try {
      var response = await NotificationApi.getNotification();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('error occured');
    }
  }

  static Future markAsRead(String id) async {
    try {
      var response = await NotificationApi.markAsRead(id);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('error occured');
    }
  }

  static Future deleteNotification(String id) async {
    try {
      var response = await NotificationApi.deleteNotification(id);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('error occured');
    }
  }
}