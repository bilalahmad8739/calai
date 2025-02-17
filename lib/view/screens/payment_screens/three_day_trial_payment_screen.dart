import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/homescreens/homescreen.dart';
import 'package:cal_ai/view/screens/payment_screens/free_trail_payment_screen.dart';
import 'package:cal_ai/view/screens/payment_screens/payme;nt_components/bottom_button_widget.dart';
import 'package:cal_ai/view/screens/payment_screens/payme;nt_components/payment_custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreeDaysTrailPaymentScreen extends StatefulWidget {
  const ThreeDaysTrailPaymentScreen({super.key});

  @override
  _ThreeDaysTrailPaymentScreenState createState() =>
      _ThreeDaysTrailPaymentScreenState();
}

class _ThreeDaysTrailPaymentScreenState
    extends State<ThreeDaysTrailPaymentScreen> {
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
                          style: titleTextStyles.copyWith(color: primaryColor),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          "Now",
                          style: bodyTextStyle,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        PaymentCustomContainerWidget(
                          textStyle: titleTextStyless,
                          ontap: () {},
                          imagePath: "assets/payment/images/unlock_img.png",
                          text:
                              "Access all the app's features, including AI calorie scanning and much more.",
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Text(
                          "After 2 Days - Reminder",
                          style: bodyTextStyle,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        PaymentCustomContainerWidget(
                          textStyle: titleTextStyless,
                          ontap: () {},
                          imagePath:
                              "assets/payment/images/reminder_alert_img.png",
                          text:
                              "We'll notify you when your trial period is about to end.",
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Text(
                          "After 3 Days - Billing Starts",
                          style: bodyTextStyle,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        PaymentCustomContainerWidget(
                          textStyle: bodyTextStyle.copyWith(
                              fontSize: 11.sp, color: bColor.withOpacity(0.25)),
                          ontap: () {},
                          imagePath: "assets/payment/images/crown_img.png",
                          text:
                              "You will be billed on 03-Jan-2025,unless you cancel before then.",
                        ),
                        SizedBox(
                          height: 17.h,
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
                title: "No Payment Needed at the Moment",
                buttonText: "Start for Free",
                paymentText:
                    "3 days free, then Only Rs 6,900 annually (Rs 575/month)",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
