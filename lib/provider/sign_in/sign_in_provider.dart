


import 'package:flutter/material.dart';
import 'package:flutter_app_provider/api_services/base_api_services.dart';
import 'package:flutter_app_provider/models/authentication.dart';

class SignInProvider extends ChangeNotifier {

  SignInProvider();

  Future<Authentication?> login(String user, String password) {
    return BaseApiService().login(user, password);
  }
}