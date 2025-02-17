import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/Signupheight_and_weight_selection_screen.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpCalorieAIScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  final int months;
  SignUpCalorieAIScreen({required this.data, this.months = 6, super.key});

  @override
  Widget build(BuildContext context) {
    print("map keys ---------------->${data.toString()}");
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
                      image: "assets/authentication/images/line3_img.png"),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Track, adapt, and thrive with Calorie AI!",
                    style: titleTextStyless,
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                Stack(
  children: [
    Container(
      height: 315.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 12.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: bColor.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          )
        ],
        color: containerColor,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Column(
        children: [
          Image.asset(
            height: 190.h,
            "assets/authentication/images/Graph_img.png",
            fit: BoxFit.contain, // Ensures proper scaling
          ),
          SizedBox(height: 30.h),
          Text(
            "Most of the user maintain 50% weight loss every $months months later. Stay motivated for what's ahead.",
            style: bodyTextStyle,
            textAlign: TextAlign.start, // Center text inside the container
          ),
        ],
      ),
    ),

    // Title "Your Weight" at the top
    Positioned(
      top: 10.h,
      left: 0,
      right: 0,
      child: Center(
        child: Text(
          "Your Weight",
          style: buttonSubtitleTextStyles2.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),

    // Right-side text (Diet before MacroPal AI)
    Positioned(
      top: 70.h,
      right: 10.w, // Keeps it within the container
      child: Container(
        width: 120.w, // Limit width to prevent overflow
        child: Text(
          "Diet before MacroPal AI",
          style: buttonSubtitleTextStyles2.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.right, // Align text to the right
          softWrap: true, // Prevents text from overflowing
        ),
      ),
    ),




    Positioned(
      top: 130.h,
      right: 10.w, // Keeps it within the container
      child: Container(

        width: 100.w, // Limit width to prevent overflow
        child: Text(
          
          "Diet after MacroPal Ai",
          style: buttonSubtitleTextStyles2.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.right, // Align text to the right
          softWrap: true, // Prevents text from overflowing
        ),
      ),
    ),
  ],
),

               
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
                    builder: (context) => SignUpHeightWeightSelectionScreen(
                      data: {
                        ...data,
                        // "months":months
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
