
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimationsDemo extends StatefulWidget {
  static const ROUTENAME = 'AnimationsDemo';
  @override
  AnimationsDemoState createState() => AnimationsDemoState();
}

class AnimationsDemoState extends State<AnimationsDemo> {
  static const TAG = 'AnimationsDemo';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Hero(
        tag: 'photo',
        transitionOnUserGestures: false,
        child: Center(
          child: Image.asset('assets/images/logo.jpg',width: 300,),
        ),
      ),
    );
  }
}