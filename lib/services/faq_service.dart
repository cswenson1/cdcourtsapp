import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:CDCourtServices/constant.dart';
import 'package:CDCourtServices/models/Faq.dart';

import 'package:http/http.dart' as http;

class FaqService extends ChangeNotifier {
  Future<List<Faq>> getAllFaqs() async {
    var response = await http.get(Constant.REST_URl + '/faq');

    if (response.statusCode == 200) {
      dynamic responseBody = json.decode(response.body);
      List data = responseBody['data'];
      List<Faq> items = data
          .map((e) => Faq.fromJson(e))
          .toList();
      return items;
    } else {
      throw Exception('No Data Found');
    }
  }
}
