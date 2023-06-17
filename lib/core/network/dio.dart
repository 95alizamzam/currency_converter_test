import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClass {
  final Dio dio = Dio()
    ..options = BaseOptions(
      baseUrl: 'https://v6.exchangerate-api.com/v6/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
        // 'Access-Control-Allow-Origin': '*',
        // 'Access-Control-Allow-Methods': 'GET',
      },
    )
    ..interceptors.add(LogInterceptor());
}
