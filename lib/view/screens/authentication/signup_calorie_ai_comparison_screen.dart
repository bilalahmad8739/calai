import 'package:cal_ai/test.dart';
import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_nutrition_challenge_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpCalorieAIComparisonScreen extends StatefulWidget {
  late Map<String, dynamic> data;

  SignUpCalorieAIComparisonScreen({required this.data});
  @override
  _SignUpCalorieAIComparisonScreenState createState() =>
      _SignUpCalorieAIComparisonScreenState();
}

class _SignUpCalorieAIComparisonScreenState
    extends State<SignUpCalorieAIComparisonScreen> {
  double _currentWeight = 0.0;
  @override
  Widget build(BuildContext context) {
    print("Ai screen --------------->${widget.data.toString()}");
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
                          image: "assets/authentication/images/line8_img.png"),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Achieve double the results with MacroPal AI compared to going solo!",
                          style: titleTextStyless,
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              //  crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "with  MacroPal AI",
                                  style: bodyTextStyle2.copyWith(
                                      fontSize: 16.sp, color: primaryColor),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),

                              const   DashedCircularProgressIndicator(
                                  percentage:
                                      40.5, // Progress percentage (adjustable)
                                  dashWidth: 2.3, // Width of each dash
                                  dashHeight: 6.0, // Height of each dash
                                  strokeWidth: 3.0, // Thickness of dashes
                                  backgroundStrokeWidth:
                                      5.0, // Now you can change this!
                                ),

                                // CircularPercentIndicator(
                                //     percent: 0.125,
                                //     progressColor: bColor,
                                //     center: Text(
                                //       "12.5 %",
                                //       style: bodyTextStyle2.copyWith(
                                //           fontWeight: FontWeight.w500),
                                //     ),
                                //     radius: 60)
                              ],
                            ),
                            // const Spacer(),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "without  MacroPal AI 2x",
                                    style: bodyTextStyle2.copyWith(
                                        fontSize: 16.sp, color: primaryColor),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),

                            const       DashedCircularProgressIndicator(
                                  percentage:
                                      75.5, // Progress percentage (adjustable)
                                  dashWidth: 2.3, // Width of each dash
                                  dashHeight: 6.0, // Height of each dash
                                  strokeWidth: 3.0, // Thickness of dashes
                                  backgroundStrokeWidth:
                                      5.0, // Now you can change this!
                                ),



                                  // CircularPercentIndicator(
                                  //     percent: 0.75,
                                  //     progressColor: bColor,
                                  //     center: Text(
                                  //       "75 %",
                                  //       style: bodyTextStyle2.copyWith(
                                  //           fontWeight: FontWeight.w500),
                                  //     ),
                                  //     radius: 60)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 77.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          textAlign: TextAlign.center,
                          "MacroPal AI makes tracking calories simple and ensures reliability",
                          style: bodyTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            Positioned(
              bottom: 0.h,
              left: 0,
              right: 0,
              child: NextButtonWidget(
                title: "Next",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpNutritionChallengesScreen(
                                data: {...widget.data},
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
