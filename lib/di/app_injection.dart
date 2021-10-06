

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../oauth2_interceptor.dart';

Future initInjection () async {
  //region Using for httpClient
  final Dio dio = Dio(
      BaseOptions(baseUrl: 'url') // UAT
  );
  dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true
  ));
  dio.interceptors.add(
    Oauth2Interceptor(
      dio: dio,
      oauth2Dio: Dio(BaseOptions(baseUrl: dio.options.baseUrl,     receiveDataWhenStatusError: true,),
    ),
    )
  );

  GetIt.instance.registerSingleton(dio);

  //region Local Service
  GetIt.instance.registerSingleton(await SharedPreferences.getInstance());

}