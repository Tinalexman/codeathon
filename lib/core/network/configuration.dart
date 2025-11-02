import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

export 'package:dio/dio.dart';

late Dio dio;

void initializeNetworkConfigurations() {
  String baseUrl = "";
  dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 90),
      sendTimeout: const Duration(seconds: 90),
      receiveTimeout: const Duration(seconds: 90),
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }
}
