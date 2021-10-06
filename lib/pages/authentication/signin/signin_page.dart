import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_provider/pages/home/home_page.dart';
import 'package:flutter_app_provider/provider/sign_in/sign_in_provider.dart';
import 'package:flutter_app_provider/widgets/design_system/app_bar_widget.dart';
import 'package:flutter_app_provider/widgets/design_system/form/app_text_form_field.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  static const ROUTENAME = 'SigninPage';
  const SigninPage({Key? key}) : super(key: key);

  @override
  SigninPageState createState() => SigninPageState();
}

class SigninPageState extends State<SigninPage> {
  static const TAG = 'SigninPage';
  final GlobalKey<FormState> _form = GlobalKey();
  late SignInProvider _provider;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => SignInProvider(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Đăng nhập'),
            centerTitle: true,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
          body: Form(
            key: _form,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Đăng nhập', style: TextStyle(color: Colors.black,fontSize: 18),),
                  const SizedBox(height: 24,),
                  AppTextFormField(
                    title: 'Tài khoản',
                    hint: 'Nhập tài khoản',
                    backgroundColor: Colors.white70,
                  ),
                  const SizedBox(height: 24,),
                  AppTextFormField(
                    title: 'Mật khẩu',
                    hint: 'Nhập mật khẩu',
                    isPassword: true,
                    backgroundColor: Colors.white70,
                  ),
                  const SizedBox(height: 32,),
                  Container(
                    color: Colors.greenAccent,
                    child: ElevatedButton(
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        SignInProvider().login('aa', 'password').then((value) {
                          if(value!=null){
                            Navigator.pushReplacementNamed(context, HomePage.ROUTENAME);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}