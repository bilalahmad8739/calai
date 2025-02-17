import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_button_widget.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_fitness_routine_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpGenderSelectionScreen extends StatefulWidget {
  const SignUpGenderSelectionScreen({super.key});

  @override
  State<SignUpGenderSelectionScreen> createState() =>
      _SignUpGenderSelectionScreenState();
}

class _SignUpGenderSelectionScreenState
    extends State<SignUpGenderSelectionScreen> {
  String selectedGender = "Male";
  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
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
              padding: EdgeInsets.only(left: 20.w, right: 30.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderRow(
                    image: "assets/authentication/images/line1_img.png",
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Select Your Gender",
                      style: titleTextStyless,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "This step ensures that your nutrition plan is tailored just for you.",
                      style: bodyTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 10.w),
                   child: Column(
                    children: [
                       CustomButtonWidget(
                      height: 50.h,
                      width: double.infinity,
                      textStyle: buttonTextStyle.copyWith(color: bColor),
                      color:
                          selectedGender == "Male" ? bgColor : Color(0xffF0EEEE),
                      ontap: () {
                        selectGender("Male");
                      },
                      title: "Male",
                      borderColor:
                          selectedGender == "Male" ? bColor : containerColor,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    CustomButtonWidget(
                      height: 50.h,
                      width: double.infinity,
                      textStyle: buttonTextStyle.copyWith(color: bColor),
                      color: selectedGender == "Female"
                          ? bgColor
                          : Color(0xffF0EEEE),
                      ontap: () {
                        selectGender("Female");
                      },
                      title: "Female",
                      borderColor:
                          selectedGender == "Female" ? bColor : containerColor,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    CustomButtonWidget(
                      height: 50.h,
                      width: double.infinity,
                      textStyle: buttonTextStyle.copyWith(color: bColor),
                      color:
                          selectedGender == "Other" ? bgColor : Color(0xffF0EEEE),
                      ontap: () {
                        selectGender("Other");
                      },
                      title: "Other",
                      borderColor:
                          selectedGender == "Other" ? bColor : containerColor,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    ],
                   ),
                 )
                  // const Spacer(),
                ],
              ),
            ),

            const Spacer(),
            //nextbutton
            NextButtonWidget(
              loading: false,
              title: "Next",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SignUpFitnessRoutineSelectionScreen(
                              data: {
                                'selectedGender': selectedGender,
                              },
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
