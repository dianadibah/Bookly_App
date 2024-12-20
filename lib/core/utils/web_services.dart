import 'package:bookly/core/utils/base_url.dart';
import 'package:dio/dio.dart';

class WebServices {
  final Dio _dio;

  WebServices(this._dio);

  Future<Map<String, dynamic>> get(String endpoint) async {
    var res = await _dio.get("$baseUrl/$endpoint");
    return res.data;
  }
}
