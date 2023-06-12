import 'package:dio/dio.dart';
import 'package:sharada_app/utils/constants/global.dart';
import 'package:sharada_app/utils/dio_interceptor.dart';

Dio getAppDio() {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    sendTimeout: const Duration(seconds: 40),
    receiveTimeout: const Duration(seconds: 40),
  ));
  dio.interceptors.add(DioInterceptor());
  return dio;
}
