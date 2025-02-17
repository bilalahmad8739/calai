import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_button_widget.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_referral_process_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpNotificationPermissionScreen extends StatefulWidget {
  late Map<String, dynamic> data;
  SignUpNotificationPermissionScreen({
    required this.data,
  });
  @override
  _SignUpNotificationPermissionScreenState createState() =>
      _SignUpNotificationPermissionScreenState();
}

class _SignUpNotificationPermissionScreenState
    extends State<SignUpNotificationPermissionScreen> {
  int _selectedIndex = 0;
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderRow(
                      image: "assets/authentication/images/line12_img.png"),
                  SizedBox(
                    height: 120.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Stay on track and achieve more with timely notifications!",
                    style: titleTextStyles.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomButtonWidget(
                      align: TextAlign.center,
                      height: 60.h,
                      width: double.infinity,
                      ontap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      borderColor:
                          _selectedIndex == 0 ? bColor : containerColor,
                      color: _selectedIndex == 0 ? bgColor : containerColor,
                      title:
                          "MacroPal AI requests permission to send you real-time updates",
                      textStyle: bodyTextStyle.copyWith(
                          color: bColor, fontWeight: FontWeight.w600)),
                  CustomButtonWidget(
                      height: 60.h,
                      width: double.infinity,
                      ontap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      color: _selectedIndex == 1 ? bgColor : containerColor,
                      borderColor:
                          _selectedIndex == 1 ? bColor : containerColor,
                      title: "Allow",
                      textStyle: bodyTextStyle.copyWith(color: bColor)),
                  CustomButtonWidget(
                      height: 60.h,
                      width: double.infinity,
                      ontap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      borderColor:
                          _selectedIndex == 2 ? bColor : containerColor,
                      color: _selectedIndex == 2 ? bgColor : containerColor,
                      title: "Deny",
                      textStyle: bodyTextStyle.copyWith(color: bColor)),
                ],
              ),
            ),
            const Spacer(),
            NextButtonWidget(
              title: "Next",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpReferralProcessScreen(
                              data: widget.data,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
