import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/text.dart';
import 'package:flutter_challenge/ui/login/login-screen.dart';
import 'package:flutter_challenge/ui/splash/splash-screen.dart';
import 'constants/style_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: SetText.title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: defaultc200Color,
        scaffoldBackgroundColor: whiteColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
