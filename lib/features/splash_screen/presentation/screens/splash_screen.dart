import 'dart:async';

import 'package:clean_artiticture_learning/config/routes/app_routes.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/assets_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  _goNext() => Navigator.pushReplacementNamed(context, Routes.randomQuoteRoute);
  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), () {
      _goNext();
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageManager.splashImage,
          width: 200.0,
          height: 400.0,
        ),
      ),
    );
  }
}
