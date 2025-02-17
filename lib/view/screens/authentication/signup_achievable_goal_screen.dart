import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_progress_speed_screen.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpAchievableGoalsScreen extends StatefulWidget {
    late Map<String, dynamic> data;


    SignUpAchievableGoalsScreen({required this.data});
  @override
  _SignUpAchievableGoalsScreenState createState() => _SignUpAchievableGoalsScreenState();
}

class _SignUpAchievableGoalsScreenState extends State<SignUpAchievableGoalsScreen> {
  final ScrollController _scrollController = ScrollController();
  int  weight = 10;

  @override
  Widget build(BuildContext context) {
        print("Goal selection screen --------------->${widget.data.toString()}");
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderRow(image: "assets/authentication/images/line6_img.png"),
                  SizedBox(
                    height: 150.h,
                  ),
                  Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 15.w),
                    child: RichText(
                      text: TextSpan(
                        style: buttonTextStyle.copyWith(
                            color: bColor), // default style
                        children: [
                          TextSpan(
                              text: "Setting a goal to ",
                              style: buttonTextStyle.copyWith(color: bColor)),
                          TextSpan(
                            text:
                                "increase $weight kg", // This is the part you want to style differently
                            style: buttonTextStyle.copyWith(
                                color: bColor.withOpacity(0.5),
                                fontSize: 18.sp), // Custom font size for 5 kg
                          ),
                          TextSpan(
                            text:
                                " is achievable and within your reach. With consistent effort, you can make it happen!",
                            style: buttonTextStyle.copyWith(color: bColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      "Noticeable changes report by 50% users aftersing Calorie AI, with long-lasting results and minimal chances of regression.",
                      style: bodyTextStyle,
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            NextButtonWidget(
              title: "Next",
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpProgressSpeedScreen(data: {
            ...widget.data,
            // 'weight':weight,
                },)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
