import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'applications.dart';
import 'di/app_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initInjection();
  runApp(
       DevicePreview(
           enabled: !kReleaseMode,
           builder: (context) => const Application())
  );
}

