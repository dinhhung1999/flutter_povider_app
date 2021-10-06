

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app_provider/models/models.dart';
import 'package:get_it/get_it.dart';

class BaseApiService {
  Dio dio = GetIt.instance.get();

  Future<Authentication?> login(String user, String password) async {
    // return AuthenticationDto('abc', 'def');
    try {
      var body = {
        "password": password,
        "username": user};
      // var response = await dio.post(
      //     "login", data: body);
      // if (response.statusCode == 200 ) {
      //
      //
      // }
      // else  {
      //   throw response.data['message'];
      // }
      return Authentication('token');
    }on DioError catch (ex) {
      if (ex.response?.statusCode==401){
        // throw '';
      } else {
        throw 'Vui lòng kiểm tra kết nối mạng!';
      }

    } on TimeoutException catch (ex){
      throw 'Vui lòng kiểm tra kết nối mạng!';
    }
  }

}