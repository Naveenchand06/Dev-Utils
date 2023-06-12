import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:sharada_app/main.dart';
import 'package:sharada_app/utils/storage/storage_strings.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = pref.getString(StorageStr.token);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    debugPrint('REQUEST Path -> ${options.path}');
    debugPrint('REQUEST Data -> ${options.data}');

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    debugPrint('RESPONSE Path -> ${response.realUri}');
    debugPrint('RESPONSE Data -> ${response.data}');
    super.onResponse(response, handler);
  }
}
