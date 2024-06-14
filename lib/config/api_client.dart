import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient({required String baseUrl, required String apiKey}) {
    _instance._dio.options.baseUrl = baseUrl;
    _instance._dio.options.queryParameters = {'api_key': apiKey};
    return _instance;
  }

  Dio _dio;

  ApiClient._internal() : _dio = Dio();

  Dio get dio => _dio;
}