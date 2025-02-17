import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/screens/authentication/signup_tracking_selection_screen.dart';
import 'package:cal_ai/view/components/custom_button_row_widget.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFitnessRoutineSelectionScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const SignUpFitnessRoutineSelectionScreen({required this.data, super.key});

  @override
  State<SignUpFitnessRoutineSelectionScreen> createState() =>
      _SignUpFitnessRoutineSelectionScreenState();
}

class _SignUpFitnessRoutineSelectionScreenState
    extends State<SignUpFitnessRoutineSelectionScreen> {
  String selectedTitle = "";
  String selectedSubTitle = "";
  final List<Map<String, String>> buttonData = [
    {"title": "0-1 :", "subTitle": "Just getting started or taking it slow"},
    {"title": "2-3 :", "subTitle": "Building consistency with light activity"},
    {
      "title": "4-5 :",
      "subTitle": "Active and maintaining a steady fitness routine"
    },
    {"title": "6-7 :", "subTitle": "Highly active with a dedicated routine"},
    {"title": "8+ :", "subTitle": "Intense training or double sessions daily"},
  ];
  @override
  void initState() {
    selectedTitle = buttonData[0]["title"]!;
    selectedSubTitle = buttonData[0]["subTitle"]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  HeaderRow(
                      image: "assets/authentication/images/line2_img.png"),
                  SizedBox(height: 25.h),
                  Text(
                    textAlign: TextAlign.center,
                    "What is your fitness routine in a week?",
                    style: titleTextStyless,
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "This activity level helps you to tailor your fitness insights!",
                      style: bodyTextStyle,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,),
                    child: Column(
                      children: List.generate(buttonData.length, (index) {
                        return CustomButtonRowWidget(
                          borderColor:
                              selectedTitle == buttonData[index]['title']
                                  ? bColor
                                  : containerColor,
                          ontap: () {
                            setState(() {
                              selectedTitle = buttonData[index]['title']!;
                              selectedSubTitle = buttonData[index]['subTitle']!;
                            });
                          },
                          color: selectedTitle == buttonData[index]['title']
                              ? bgColor
                              : containerColor,
                          title: buttonData[index]["title"]!,
                          subTitle: buttonData[index]["subTitle"]!,
                          textStyle:
                              buttonTextStyle.copyWith(color: bColor),
                          subTextStyle:
                              buttonSubtitleTextStyles.copyWith(color: bColor),
                        );
                      }),
                    ),
                  ),
                  Expanded(child: Container()), // To push content up
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 0,
            right: 0,
            child: NextButtonWidget(
              title: "Next",
              ontap: () {
                widget.data['selectTitle'] = selectedTitle;
                widget.data['selectedSubTitle'] = selectedSubTitle;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpTrackingSelectionScreen(
                      data: widget.data,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
