import 'dart:async';

import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/startup_screens/daily_suggestion_selection_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SignUpLoadingScreen extends StatefulWidget {
  @override
  _SignUpLoadingScreenState createState() => _SignUpLoadingScreenState();
}

class _SignUpLoadingScreenState extends State<SignUpLoadingScreen> {

  bool isloading = false;

  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DailySuggestionSelectionScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 51.w),
                child: Text(
                  textAlign: TextAlign.start,
                  "We are preparing everything for you",
                  style: titleTextStyles.copyWith(color: primaryColor),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Creating Health Plan to Fit Your Needs...",
                style: bodyTextStyle,
              ),
              SizedBox(
                height: 60.h,
              ),
              LoadingOverlay(
                  color: bColor,
                  isLoading: isloading,
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
