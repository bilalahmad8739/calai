import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/authentication/signup_colorie_ai_screen.dart';
import 'package:cal_ai/view/components/custom_button_widget.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTrackingSelectionScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const SignUpTrackingSelectionScreen({required this.data, super.key});

  @override
  State<SignUpTrackingSelectionScreen> createState() =>
      _SignUpTrackingSelectionScreenState();
}

class _SignUpTrackingSelectionScreenState
    extends State<SignUpTrackingSelectionScreen> {
  String trackingVariable = "Yes";

  void checkData(String check) {
    setState(() {
      trackingVariable = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Column(
                children: [
                  HeaderRow(
                      image: "assets/authentication/images/line4_img.png"),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Have you used any other calorie-tracking apps before?",
                    style: titleTextStyless,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  //Yes button
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        GestureDetector(
                      onTap: () {
                        checkData("Yes");
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 15.h),
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: trackingVariable == "Yes"
                                  ? bgColor
                                  : containerColor,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                    color: bColor.withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 0)),
                              ],
                              border: Border.all(
                                  color: trackingVariable == "Yes"
                                      ? bColor
                                      : containerColor,
                                  width: 2)),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment
                                  .baseline, // Align based on baseline
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Image.asset(
                                    color: bColor,
                                    "assets/authentication/images/tick_img.png"),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                  "Yes",
                                  //"Just getting started or taking it slow",
                                  style: buttonTextStyle.copyWith(color: bColor),
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    //No Button
                    GestureDetector(
                      onTap: () {
                        checkData("No");
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 15.h),
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: trackingVariable == "No"
                                  ? bgColor
                                  : containerColor,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: [
                                BoxShadow(
                                    color: bColor.withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 0)),
                              ],
                              border: Border.all(
                                  color: trackingVariable == "No"
                                      ? bColor
                                      : bgColor,
                                      width:2,
                                      )),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment
                                  .baseline, // Align based on baseline
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Image.asset(
                                    color: bColor,
                                    height: 25.h,
                                    width: 25.w,
                                    fit: BoxFit.contain,
                                    "assets/authentication/images/cross_img.png"),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                  "No",
                                  //"Just getting started or taking it slow",
                                  style: buttonTextStyle.copyWith(color: bColor),
                                ),
                              ],
                            ),
                          )),
                    ),
                                 
                    ],
                  ),
                )
               
               
                ],
              ),
            ),
            Spacer(),
            NextButtonWidget(
              title: "Next",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpCalorieAIScreen(
                      data: {
                        ...widget.data,
                        "trackingVariable": trackingVariable
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
