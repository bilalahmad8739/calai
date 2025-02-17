import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/authentication/signup_diet_selection_screen.dart';
import 'package:cal_ai/view/screens/authentication/signup_monthly_progress_screen.dart';
import 'package:cal_ai/view/components/custom_button_widget.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SignUpFitnessGoalSelectionScreen extends StatefulWidget {
  late Map<String, dynamic> data;

  SignUpFitnessGoalSelectionScreen({
    required this.data,
  });

  @override
  _SignUpFitnessGoalSelectionScreenState createState() =>
      _SignUpFitnessGoalSelectionScreenState();
}

class _SignUpFitnessGoalSelectionScreenState
    extends State<SignUpFitnessGoalSelectionScreen> {
  String selectedGoalTitles = 'Balanced diet with nutritious foods';
  // List of goal titles
  final List<String> goalTitles = [
    "Regular exercise for physical fitness",
    "Balanced diet with nutritious foods",
    "Adequate sleep for recovery and energy",
    "Hydration to support bodily functions",
    "Stress management through relaxation",
    "Regular medical check-ups for early detection"
  ];

  @override
  Widget build(BuildContext context) {
    print("Fitness goal Screen --------------->${widget.data.toString()}");

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
                      image: "assets/authentication/images/line9_img.png"),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "What goals would you like to achieve?",
                      style: titleTextStyless,
                    ),
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  ...goalTitles.map((goal) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: 20.h, left: 10.w, right: 10.w),
                      child: CustomButtonWidget(
                          height: 52.h,
                          width: double.infinity,
                          ontap: () {
                            setState(() {
                              selectedGoalTitles = goal;
                            });
                          },
                          borderColor: selectedGoalTitles == goal
                              ? bColor
                              : containerColor,
                          color: selectedGoalTitles == goal
                              ? bgColor
                              : containerColor,
                          //containerColor,
                          title: goal, // Display the correct goal title
                          textStyle: bodyTextStyle.copyWith(color: bColor)),
                    );
                  }).toList()
                ],
              ),
            ),
            // Spacer(),
            Positioned(
              bottom: 0.h,
              right: 0.w,
              left: 0.w,
              child: NextButtonWidget(
                title: "Next",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpMonthlyProgressScreen(
                                data: {
                                  ...widget.data,
                                  'selectGoalTitle': selectedGoalTitles,
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
