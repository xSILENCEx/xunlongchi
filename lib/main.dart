import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xunlongchi/ui/splash_page.dart';

import 'mod/time_mod.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(const MyApp());

  //状态栏透明
  const SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimeMod>(
      create: (_) => TimeMod(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '寻龙尺',
        home: SplashPage(),
      ),
    );
  }
}
