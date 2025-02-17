import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/authentication/signup_calorie_ai_comparison_screen.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpProgressSpeedScreen extends StatefulWidget {
  late Map<String, dynamic> data;

  SignUpProgressSpeedScreen({required this.data});
  @override
  _SignUpProgressSpeedScreenState createState() =>
      _SignUpProgressSpeedScreenState();
}

class _SignUpProgressSpeedScreenState extends State<SignUpProgressSpeedScreen> {
  double _currentWeight = 0.0;
  @override
  Widget build(BuildContext context) {
    print("Progress screen --------------->${widget.data.toString()}");

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeaderRow(
                          image: "assets/authentication/images/line7_img.png"),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          textAlign: TextAlign.center,
                          "How quickly would you like to achieve your target?",
                          style: titleTextStyless,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 8.h),
                        // height: 35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          color: primaryColor,
                        ),
                        child: Text(
                          'Rate of weight gain per week',
                          style: buttontitleTextStyles.copyWith(
                              color: wColor, fontSize: 12.sp),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        "${_currentWeight.toStringAsFixed(1)} kg", // Fixed to 2 decimal places
                        style: titleTextStyles.copyWith(
                            fontWeight: FontWeight.w600, color: primaryColor),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      //row for bike images
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                                color: _currentWeight == 0
                                    ? primaryColor
                                    : btnColor,
                                height: 35.h,
                                width: 35.w,
                                fit: BoxFit.contain,
                                "assets/authentication/images/bike.png"),
                            Image.asset(
                                color: _currentWeight == 50
                                    ? primaryColor
                                    : btnColor,
                                height: 35.h,
                                width: 35.w,
                                fit: BoxFit.contain,
                                "assets/authentication/images/car.png"),
                            Image.asset(
                                color: _currentWeight == 100
                                    ? primaryColor
                                    : btnColor,
                                height: 35.h,
                                width: 35.w,
                                fit: BoxFit.contain,
                                "assets/authentication/images/plane.png"),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),

                     Stack(
  alignment: Alignment.center,
  children: [
    SliderTheme(
  data: SliderTheme.of(context).copyWith(
    trackHeight: 55.h,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 30.h),
    thumbColor: wColor,
    overlayColor: Colors.blue.withOpacity(0.2),
    activeTrackColor: bColor,
    inactiveTrackColor: containerColor,
    showValueIndicator: ShowValueIndicator.always, // Always show label
    valueIndicatorShape: PaddleSliderValueIndicatorShape(), // Keeps label above thumb
    valueIndicatorColor: primaryColor, // Background color of label
    valueIndicatorTextStyle: titleTextStyles.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white, // Text inside label
    ),
  ),
  child: Slider(
    value: _currentWeight,
    min: 0,
    max: 100,
    divisions: 100,
    label: "${_currentWeight.toStringAsFixed(1)} kg", // Always shows above thumb
    onChanged: (double value) {
      setState(() {
        _currentWeight = value;
      });
    },
  ),
),

    
    // Positioned(
    //   top: 15.h, // Adjust this to place the text above the thumb
    //  left: (_currentWeight / 100) * (MediaQuery.of(context).size.width - 20.w), // Adjust for centering
    //   child: Text(
    //     "${_currentWeight.toStringAsFixed(1)} kg",
    //     style: titleTextStyles.copyWith(
    //       fontSize: 12.sp,
    //       fontWeight: FontWeight.w400,
    //       color: bColor,
    //     ),
    //   ),
    // ),
  ],
),


                      SizedBox(
                        height: 70.h,
                      ),
                      //Text of show progress
                      Container(
                          width: 225.w,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 10.w, horizontal: 2.w),
                          decoration: BoxDecoration(
                              border: Border.all(color: containerColor),
                              borderRadius: BorderRadius.circular(24.r),
                              color: bgColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    color: bColor.withOpacity(0.2))
                              ]),
                          child: _currentWeight <= 49
                              ? Text(
                                  "Slow  progress",
                                  style:
                                      bodyTextStyle.copyWith(fontSize: 12.sp),
                                )
                              : _currentWeight <= 99
                                  ? Text(
                                      "Preferred",
                                      style: bodyTextStyle.copyWith(
                                          fontSize: 12.sp),
                                    )
                                  : _currentWeight == 100
                                      ? Text(
                                          "You might experience fatigue and notice a reduction in skin elasticity",
                                          style: bodyTextStyle.copyWith(
                                              fontSize: 12.sp),
                                        )
                                      : Container())
                    ],
                  ),
                ),
                // Spacer(),
              ],
            ),
            Positioned(
              // top: 0.h,
              bottom: 0.h,
              left: 0,
              right: 0,
              child: NextButtonWidget(
                title: "Next",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpCalorieAIComparisonScreen(
                                data: {
                                  ...widget.data,
                                  'currentWeight': _currentWeight,
                                },
                              )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
