import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_loading_screen.dart';
import 'package:cal_ai/view/screens/authentication/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpAppreciationScreen extends StatefulWidget {
  late Map<String, dynamic> data;
  SignUpAppreciationScreen({
    required this.data,
  });
  @override
  _SignUpAppreciationScreenState createState() =>
      _SignUpAppreciationScreenState();
}

class _SignUpAppreciationScreenState extends State<SignUpAppreciationScreen> {
  @override
  Widget build(BuildContext context) {
    print("Thankyou Screen --------------->${widget.data.toString()}");

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeaderRow(
                      image: "assets/authentication/images/line14_img.png"),
                  SizedBox(
                    height: 80.h,
                  ),
                  Stack(
                    children: [
                      Image.asset(
                          height: 200.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          "assets/authentication/images/congratulations.png"),
                      Padding(
                        padding: EdgeInsets.only(top: 130.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    height: 15.h,
                                    fit: BoxFit.contain,
                                    "assets/authentication/images/done_img.png"),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Done!",
                                  style: buttontitleTextStyles.copyWith(
                                      color: bColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35.w),
                    child: Text(
                        textAlign: TextAlign.center,
                        "Thank You we appreciate you for trusting us",
                        style: titleTextStyless),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "We are committed to ensuring that your personal information remains safe and confidential.",
                    style: bodyTextStyle,
                  ),
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
                        builder: (context) => LoginScreen(
                              data: {
                                ...widget.data,
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
