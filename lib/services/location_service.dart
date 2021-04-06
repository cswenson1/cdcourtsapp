import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:CDCourtServices/constant.dart';
import 'package:CDCourtServices/models/Location.dart';

import 'package:http/http.dart' as http;

class LocationService extends ChangeNotifier {
  Future<List<Location>> getAllLocations() async {
    String url = Constant.REST_URl + '/user/office';
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

    List data = responseBody['data'];
    List<Location> locations =
        data.map((location) => Location.fromJson(location)).toList();
    return locations;
  }
}
