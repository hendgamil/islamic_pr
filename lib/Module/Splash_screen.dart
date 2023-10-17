import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamic_pr/layout/home_screen.dart';
import 'package:islamic_pr/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = "Splash_screen";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    Timer(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: provider.appMode == ThemeMode.dark
          ? Image.asset(
              "Assets/image/splash – 1.png",
              width: mediaQuery.width,
              height: mediaQuery.height,
              fit: BoxFit.cover,
            )
          : Image.asset(
              "Assets/image/splash_screen.png",
              width: mediaQuery.width,
              height: mediaQuery.height,
              fit: BoxFit.cover,
            ),
    );
  }
}
