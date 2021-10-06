import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_provider/gen/assets.gen.dart';

typedef  InitializeApp = Future<dynamic> Function(BuildContext context);

class AppSplashPage extends StatefulWidget {
  final InitializeApp initializeApp;
  AppSplashPage(this.initializeApp);


  @override
  _AppSplashPageState createState() => _AppSplashPageState();
}

class _AppSplashPageState extends State<AppSplashPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Assets.images.logo.image(width: 250,height: 250)
        ),
      ),
    );
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.initializeApp(context).then((state) {
      if(mounted) {

      }
    });
  }
}
