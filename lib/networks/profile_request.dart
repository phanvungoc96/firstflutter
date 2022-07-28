import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/profile.dart';

class ProfileRequest {
  static const String url =
      "https://62da21679eedb699636737fb.mockapi.io/news/Users";

  static List<ProfileModel> parseProfile(String req) {
    var list = json.decode(req) as List<dynamic>;
    List<ProfileModel> profiles =
        list.map((e) => ProfileModel.fromJson(e)).toList();
    return profiles;
  }

  static Future<List<ProfileModel>> fetchProfiles() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parseProfile, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Lỗi');
    } else {
      throw Exception('Không thể lấy tin tức ');
    }
  }
}
