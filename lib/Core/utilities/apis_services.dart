import 'package:dio/dio.dart';

class ApisServices {
  ApisServices(this._dio);
  final String _baseurl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response response = await _dio.get('$_baseurl$endpoint');
    return response.data;
  }
}
