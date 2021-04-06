import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:CDCourtServices/constant.dart';
import 'package:CDCourtServices/models/Notification.dart';

import 'package:http/http.dart' as http;

class NotificationService extends ChangeNotifier {
  Future<List<Notifications>> getAllNotifications() async {
    String url = Constant.REST_URl + '/user/notifications';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer $token',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode != 200) {
      print(response);
      throw Exception('API Error Occurred');
    }

    dynamic responseBody = json.decode(response.body);
    if (!responseBody['status']) {
      print(responseBody);
      throw Exception('API Error Occurred');
    }

    List data = responseBody['data']['notification'];
    List<Notifications> notifications = data
        .map((notification) => Notifications.fromJson(notification))
        .toList();
    return notifications;
  }

  Future<bool> updateNotification(List<int> notificationsIDs) async {
    String url = Constant.REST_URl + '/user/notifications/update/seen';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer $token',
    };
    Map<String, List<int>> body = {"id": notificationsIDs};

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    try {
      if (response.statusCode != 200) {
        print(response);
        throw Exception('API Error Occurred');
      }

      dynamic responseBody = json.decode(response.body);
      if (responseBody['code'] != 200) {
        print(responseBody);
        throw Exception('API Error Occurred');
      }

      if (!responseBody['status']) {
        print(responseBody);
        throw Exception('API Error Occurred');
      }
      return true;
    } on Exception {
      return false;
    }
  }
}
