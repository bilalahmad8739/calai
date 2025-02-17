import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_appreciation_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpReferralProcessScreen extends StatefulWidget {
  late Map<String, dynamic> data;
  SignUpReferralProcessScreen({
    required this.data,
  });
  @override
  _SignUpReferralProcessScreenState createState() =>
      _SignUpReferralProcessScreenState();
}

class _SignUpReferralProcessScreenState
    extends State<SignUpReferralProcessScreen> {
  var _formKey = GlobalKey<FormState>();
  final TextEditingController referralCode = TextEditingController();

  @override
  void dispose() {
    referralCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Referral Code Screen --------------->${widget.data.toString()}");

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      image: "assets/authentication/images/line13_img.png"),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Enter your referral code to proceed!",
                      style: titleTextStyless,
                    ),
                  ),
                  SizedBox(
                    height: 200.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "You may proceed without completing this step.",
                      style: bodyTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Form(
                      key: _formKey,
                      child: DottedBorder(
                        color: bColor,
                        strokeWidth: 2,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        dashPattern: [6, 3], // Lengt
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: referralCode,
                          decoration: InputDecoration(
                            hintStyle: bodyTextStyle.copyWith(
                                color: bColor.withOpacity(0.25)),
                            border: InputBorder.none,
                            hintText: "Referral Code",
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            NextButtonWidget(
              title: "Next",
              ontap: () {
                widget.data['referralCode'] = referralCode.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpAppreciationScreen(
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
