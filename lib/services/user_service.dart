import 'dart:convert';
import 'dart:io' show Platform;

import 'package:CDCourtServices/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:CDCourtServices/constant.dart';
import 'package:CDCourtServices/models/User.dart';

import 'package:http/http.dart' as http;

class UserService extends ChangeNotifier {
  User currentUser;

  Future<User> getCurrentUser() async {
    String url = Constant.REST_URl + '/user/profile';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer $token',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode != 200) {
      print(response);
      throw Exception('API Status Code Not 200');
    }

    dynamic data = json.decode(response.body);
    bool status = data['status'];
    if (!status) {
      print(data);
      throw Exception('API Status False');
    }

    var userData = data['data']['user'];
    User user = User.fromJson(userData);

    return user;
  }

  Future<String> login(User user) async {
    var queryParams;
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    String token = await _firebaseMessaging.getToken();
    String deviceId;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.androidId;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    }
    print(user.email);
    print(user.name);
    print(user.dob);
    print(user.phone);

    if (user.email.isEmpty ||
        user.name.isEmpty ||
        user.dob.isEmpty ||
        user.phone.isEmpty) {
      return null;
    }
    queryParams = {
      'name': user.name,
      'email': user.email,
      'dob': user.dob,
      'phone': user.phone,
      'role': user.role,
      'device_token': token,
      'device_id': deviceId
    };
    String url = Constant.REST_URl + '/user/register';

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(queryParams),
    );
    if (response.statusCode != 200) {
      print(response.body);
      throw Exception('API Error Occurred');
    }
    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      var status = data['status'];
      if (status) {
        var mainData = data['data'];
        String token = mainData['token'];
        User currentUser = User(
          name: user.name,
          email: user.email,
          dob: user.dob,
          phone: user.phone,
          token: token,
        );
        this.currentUser = currentUser;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', currentUser.token);
        await prefs.setString('name', currentUser.name);
        await prefs.setString('email', currentUser.email);
        return mainData['token'];
      } else {
        print(data);
        throw Exception("API Error");
      }
    } else {
      print(response);
      throw Exception('API Error');
    }
  }

  Future<bool> isCheckedIn() async {
    String url = Constant.REST_URl + '/user/check-a-checkin';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer $token',
    };
    var response = await http.post(url, headers: headers, body: jsonEncode({}));

    if (response.statusCode != 200) {
      throw Exception('Invalid Credentials');
    }

    dynamic data = json.decode(response.body);
    bool status = data['status'];
    if (!status) {
      throw Exception('Invalid Credentials');
    }

    var mainData = data['data'];
    bool isCheckedIn = mainData['checkin'];
    return !isCheckedIn;
  }

  Future<bool> requestCheckIn(params) async {
    String url = Constant.REST_URl + '/user/request-a-checkin';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer $token',
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(params),
    );
    if (response.statusCode != 200) {
      print(response);
      throw Exception('API HTTP STATUS NOT 200');
    }
    dynamic data = json.decode(response.body);
    bool status = data['status'];
    if (!status) {
      print(data);
      throw Exception('API Status False');
    }
    return status;
  }

  Future<String> refreshToken() async {
    String url = Constant.REST_URl + '/user/refresh-token';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    String email = prefs.getString('email');

    Map<String, String> params = {'email': email};
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer $token',
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(params),
    );

    if (response.statusCode != 200) {
      print(response);
      throw Exception('API HTTP STATUS NOT 200');
    }

    dynamic data = json.decode(response.body);
    int code = data['code'];
    if (code != 200) {
      print(data);
      throw Exception('API Error');
    }
    bool status = data['status'];
    if (!status) {
      print(data);
      throw Exception('API Status False');
    }
    var mainData = data['data'];
    String newToken = mainData['token'];

    prefs.setString('token', newToken);
    return newToken;
  }

  Future<User> updateProfile(Map<String, dynamic> params) async {
    String url = Constant.REST_URl + '/user/update-profile';
    print(url);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print(token);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer $token',
    };

    var response = await http.post(
      url,
      headers: headers,
      body: json.encode(params),
    );

    if (response.statusCode != 200) {
      throw Exception('API Error Occurred');
    }

    dynamic data = json.decode(response.body);

    int code = data['code'];
    if (code != 200) {
      print(data);
      throw Exception('API Error');
    }

    bool status = data['status'];
    if (!status) {
      throw Exception('API Status False');
    }

    this.currentUser = User.fromJson(data['data']['user']);
    return this.currentUser;
  }
}
