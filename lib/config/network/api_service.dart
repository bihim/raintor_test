import 'package:dio/dio.dart';
import 'package:raintor_test/config/di/injector.dart';

class ApiService {
  ApiService._();

  static Future<Response> get(String url) async {
    final response = await getIt<Dio>().get(url);
    return response;
  }
}