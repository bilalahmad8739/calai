import 'dart:async';

import 'package:cal_ai/utils/shared_preferences.dart';
import 'package:cal_ai/view/screens/homescreens/homescreen.dart';
import 'package:cal_ai/view/screens/homescreens/daily_tracking_screen.dart';
import 'package:cal_ai/view/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loginStatus();

    super.initState();
  }

void loginStatus() {
    bool islogin = CalSharedPreferences.getBool('isLoggedIn') ?? false;
    print("islogin value: $islogin");

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => islogin ? HomeScreen() : OnboardingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
                    height: 135.h,
                    width: 125.w,
                    fit: BoxFit.contain,
                    "assets/authentication/images/splashscreen_img.png"))
          ],
        ),
      ),
    );
  }
}
