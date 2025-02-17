import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_button_widget.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_weight_selector_screen.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SignUpObjectiveSelectionScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  SignUpObjectiveSelectionScreen({required this.data, super.key});

  @override
  State<SignUpObjectiveSelectionScreen> createState() =>
      _SignUpObjectiveSelectionScreenState();
}

class _SignUpObjectiveSelectionScreenState
    extends State<SignUpObjectiveSelectionScreen> {
  int _selectedIndex = 0;
  String _selectedValue = 'Increase body weight';
  final List<Map<String, dynamic>> initalValue = [
    {
      'title': 'Increase body weight',
      'initialWeight': 60,
    },
    {
      'title': 'Sustain weight',
      'initialWeight': 65,
    },
    {
      'title': 'Decrease body weight',
      'initialWeight': 60,
    },
  ];

  @override
  Widget build(BuildContext context) {
    print(
        "objective selection screen---------------->${widget.data.toString()}");

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderRow(
                      image: "assets/authentication/images/line6_img.png"),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "what is your objective about your weight?",
                    style: titleTextStyless,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Track your progress, celebrate small milestones, and stay consistent to see long-term results.",
                      style: bodyTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 85.h,
                  ),
                  _buildCustomButton(0, "Increase body weight"),
                  SizedBox(
                    height: 20.h,
                  ),
                  _buildCustomButton(1, "Sustain weight"),
                  SizedBox(
                    height: 20.h,
                  ),
                  _buildCustomButton(2, "Decrease body weight"),
                ],
              ),
            ),
            // const Spacer(),
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
                      builder: (context) => SignUpWeightSelectorScreen(
                        initalValue: {
                          ...widget.data,
                          'selectedValue': _selectedValue,
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(int index, String title) {
    final isSelected =
        _selectedIndex == index; // Determine if this button is selected
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomButtonWidget(
        height: 50.h,
        width: double.infinity,
        borderColor: isSelected ? bColor : containerColor,
        ontap: () {
          setState(() {
            _selectedIndex = index;
            _selectedValue = title;
      
            print("Selected Index: $_selectedIndex, Value: $_selectedValue");
          });
        },
        color: isSelected ? bgColor: containerColor, // Change color based on selection
        title: title,
        textStyle: bodyTextStyle.copyWith(
          color: bColor, // Change text color based on selection
        ),
      ),
    );
  }
}
