import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/place_address/place_address.dart';
import 'package:my_app/models/trending/news_trending.dart';

class PlaceAddressRequest {
  final String url = "api.locationiq.com";
  final String key = "pk.bb38d7c05db81c81a52aead2f95cca60";

  List<PlaceAddress> parseNews(String req) {
    var list = json.decode(req) as List<dynamic>;
    List<PlaceAddress> placeAddresses = list.map((e) => PlaceAddress.fromJson(e)).toList();
    return placeAddresses;
  }

  Future<List<PlaceAddress>> getPlace(String input) async {
    final queryParameters = {
      'key': 'pk.bb38d7c05db81c81a52aead2f95cca60',
      'q': input,
    };
    final uri = Uri.https(url, '/v1/autocomplete', queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return compute(parseNews, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Lỗi 404');
    } else {
      throw Exception('Không thể lấy dữ liệu!');
    }
  }
}
