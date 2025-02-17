import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/payment_screens/free_trail_payment_screen.dart';
import 'package:cal_ai/view/screens/payment_screens/payme;nt_components/bottom_button_widget.dart';
import 'package:cal_ai/view/screens/payment_screens/three_day_trial_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthlyPaymentScreen extends StatefulWidget {
  const MonthlyPaymentScreen({super.key});

  @override
  _MonthlyPaymentScreenState createState() => _MonthlyPaymentScreenState();
}

class _MonthlyPaymentScreenState extends State<MonthlyPaymentScreen> {
  bool monthlyCheckboxValue = false;
  bool yearlyCheckboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.only(left: 20.w, top: 15.h),
                  height: 35.h,
                  width: 35.w,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: btnColor),
                  child: Image.asset(
                      height: 25.h,
                      width: 25.w,
                      fit: BoxFit.contain,
                      "assets/authentication/images/arrow_back_img.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 30.h,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "Activate  MacroPal AI to achieve your goals more quickly.",
                          style: titleTextStyless,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          ". Scan food Easily",
                          style: buttontitleTextStyles.copyWith(
                              fontSize: 18.sp, color: bColor),
                        ),
                        Text(
                          "Monitor your calorie intake by simply taking a photo",
                          style: bodyTextStyle.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          ". Achieve your ideal physique",
                          style: buttontitleTextStyles.copyWith(
                              fontSize: 18.sp, color: bColor),
                        ),
                        Text(
                          "We simplify things to make achieving results effortless",
                          style: bodyTextStyle.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          ". Monitor your advancement",
                          style: buttontitleTextStyles.copyWith(
                              fontSize: 18.sp, color: bColor),
                        ),
                        Text(
                          "Keep focused with tailored insights and intelligent reminders",
                          style: bodyTextStyle.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          children: [
                            // monthly payment
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: monthlyCheckboxValue == true
                                          ? bColor
                                          : containerColor),
                                  color: containerColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 4.r,
                                      color: bColor.withOpacity(0.25),
                                      spreadRadius: 0.r,
                                    ),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 25.w,
                                  right: 25.w,
                                  bottom: 10.h,
                                  top: 10.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Monthly",
                                            style: bodyTextStyle.copyWith(
                                                fontSize: 12.sp)),
                                        Checkbox(
                                            fillColor:
                                                monthlyCheckboxValue == true
                                                    ? MaterialStateProperty.all(
                                                        bColor)
                                                    : MaterialStateProperty.all(
                                                        wColor),
                                            value: monthlyCheckboxValue,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                monthlyCheckboxValue = value!;
                                              });
                                            }),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Rs 2,900/month",
                                      style: buttonSubtitleTextStyles.copyWith(
                                          color: bColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            //yearly payment
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 25.w,
                                    right: 25.w,
                                    bottom: 10.h,
                                    top: 10.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: yearlyCheckboxValue == true
                                            ? bColor
                                            : containerColor),
                                    color: containerColor,
                                    borderRadius: BorderRadius.circular(8.r),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        blurRadius: 4.r,
                                        color: bColor.withOpacity(0.25),
                                        spreadRadius: 0.r,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Yearly",
                                            style: bodyTextStyle.copyWith(
                                                fontSize: 12.sp),
                                          ),
                                          Checkbox(
                                            fillColor:
                                                yearlyCheckboxValue == true
                                                    ? MaterialStateProperty.all(
                                                        bColor)
                                                    : MaterialStateProperty.all(
                                                        wColor),
                                            value: yearlyCheckboxValue,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                yearlyCheckboxValue = value!;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "Rs 575/month",
                                        style: buttonSubtitleTextStyles.copyWith(
                                            color: bColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -10
                                      .h, // Adjust this value to position the text above the border
                                  left: 15
                                      .w, // Adjust horizontal alignment as needed
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 2.h),
                                    decoration: BoxDecoration(
                                      color: bColor,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Text(
                                      "3 Days Free",
                                      style: containerTextStyle.copyWith(
                                        fontSize: 12.sp,
                                        color: Colors.white, // Text color
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Spacer(),
              BottomButtonWidget(
                title: "No Obligation - Cancel Anytime",
                buttonText: "Begin my Journey",
                paymentText: "Just Rs 2,900 per month",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThreeDaysTrailPaymentScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
