import 'dart:developer' as developer;

import 'package:dio/dio.dart';

String token ='1234agagaga';

class Oauth2Interceptor extends Interceptor {
  static const TAG = 'Oauth2Interceptor';

  Dio dio;
  Dio oauth2Dio;

  Oauth2Interceptor({
    required this.dio,
    required this.oauth2Dio,
  });

  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) {
    options.headers.putIfAbsent('Authorization',
        () => 'Bearer $token');
    handler.next(options);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401 //400,
    ) {

    } else {
      handler.next(error);
    }
  }
}
