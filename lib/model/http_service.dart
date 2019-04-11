import 'package:dio/dio.dart';
import 'dart:convert';

class HttpService {
  Future getData(String url) async {
    try {
      final Response response = await Dio().get(url);
      return json.decode(json.encode(response.data));
    } catch (e) {
      return print(e);
    }
  }
}
