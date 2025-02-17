import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_button_widget.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_diet_selection_screen.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpNutritionChallengesScreen extends StatefulWidget {
  late Map<String, dynamic> data;

  SignUpNutritionChallengesScreen({required this.data});
  @override
  _SignUpNutritionChallengesScreenState createState() =>
      _SignUpNutritionChallengesScreenState();
}

class _SignUpNutritionChallengesScreenState
    extends State<SignUpNutritionChallengesScreen> {
  String? _selectedChallenge =
      'High metabolism'; // Store selected challenge title

  final List<String> _challenges = [
    "Not eating enough calories",
    "Lack of consistency in meals",
    "Choosing low-calorie foods",
    "Insufficient protein intake",
    "High metabolism",
  ];

  @override
  Widget build(BuildContext context) {
    print(
        "SignUpNutritionChallengesScreen --------------->${widget.data.toString()}");

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      "What challenges are preventing you from reaching your full potential?",
                      style: titleTextStyless,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  // Generate button list from challenges
                  ..._challenges.map((challenge) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 25.h,right: 15.w,left: 15.w),
                      child: CustomButtonWidget(
                        height: 50.h,
                        width: double.infinity,
                        ontap: () {
                          setState(() {
                            _selectedChallenge = challenge;
                          });
                        },
                        color: _selectedChallenge == challenge? bgColor:containerColor,
                        //containerColor,
                        borderColor: _selectedChallenge == challenge
                            ? bColor
                            : containerColor,
                        title: challenge,
                        textStyle: bodyTextStyle.copyWith(
                          color: bColor,
                        ),
                      ),
                    );
                  }).toList(),

                  SizedBox(
                    height: 25.h,
                  ),
                  //textStyle: bodyTextStyle),
                ],
              ),
            ),
            // Spacer(),
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
                          builder: (context) => SignUpDietSelectionScreen(
                                data: {
                                  ...widget.data,
                                  'selectedChallenge': _selectedChallenge
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
