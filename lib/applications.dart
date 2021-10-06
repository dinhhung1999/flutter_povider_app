
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_provider/pages/authentication/signin/signin_page.dart';
import 'package:flutter_app_provider/pages/home/home_page.dart';
import 'package:flutter_app_provider/pages/main/main_navigator.dart';
import 'package:flutter_app_provider/pages/splash/app_splash_page.dart';
import 'themes.dart';
class Application extends StatefulWidget {

  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool isAuthentication = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light(context),
      darkTheme: dark(context),
      debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      home: AppSplashPage(
          (context) async {
           await Future.delayed(const Duration(milliseconds: 3000));
           // load config, token
             isAuthentication = false;
            if(isAuthentication) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const MainNavigator(initialRoute: HomePage.ROUTENAME,)));
            }else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                      builder: (context) => const MainNavigator(initialRoute: SigninPage.ROUTENAME,)));
            }

          }
      )

    );
  }
}
