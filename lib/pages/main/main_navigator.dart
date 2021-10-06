import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_provider/navigation/navigator_support.dart';
import 'package:flutter_app_provider/pages/authentication/signin/signin_page.dart';
import 'package:flutter_app_provider/pages/home/animations_demo.dart';
import 'package:flutter_app_provider/pages/home/home_page.dart';

class MainNavigator extends StatefulWidget {
  final String initialRoute;
  const MainNavigator({Key? key, required this.initialRoute}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return NavigatorSupport(
      initialRoute: widget.initialRoute,
      onGenerateRoute: (setting) {
        switch(setting.name){
          case SigninPage.ROUTENAME:
          return MaterialPageRoute(builder: (context) => const SigninPage());
          case HomePage.ROUTENAME:
            return MaterialPageRoute(builder: (context) => const HomePage());
            case AnimationsDemo.ROUTENAME:
            return MaterialPageRoute(builder: (context) =>  AnimationsDemo());
        }
      },
    );
  }
}
