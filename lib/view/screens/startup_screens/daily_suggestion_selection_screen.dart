import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/authentication/signup_nutrition_challenge_screen.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/payment_screens/today_free_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DailySuggestionSelectionScreen extends StatefulWidget {
  @override
  _DailySuggestionSelectionScreenState createState() =>
      _DailySuggestionSelectionScreenState();
}

class _DailySuggestionSelectionScreenState
    extends State<DailySuggestionSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeaderRow(
                        image: "assets/authentication/images/line15_img.png"),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Your custom plan is now prepared and ready for you!",
                        style: titleTextStyless,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Image.asset(
                      "assets/authentication/images/tick_img (2).png",
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You should  maintain:",
                          style:
                              buttonTextStyle.copyWith(color: primaryColor),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 25.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: bColor),
                          child: Text(
                            "60 kg",
                            style: buttontitleTextStyles,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    //container first
                    Container(
                      // height: 460.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: containerColor,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 4,
                                spreadRadius: 0,
                                color: bColor.withOpacity(0.2))
                          ]),
                      child: Column(
                        children: [
                          Text(
                            "Daily suggestion",
                            style:
                                buttonTextStyle.copyWith(color: primaryColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Feel free to update this at any time",
                            style: bodyTextStyle.copyWith(
                                color: bColor.withOpacity(0.25)),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomNutritionContainer(
                            title: "Calories",
                            subtitlle: "1645 g",
                            editOntap: () {},
                            progressCurrentStep: 5,
                            progressbarColor: bColor,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomNutritionContainer(
                            title: "Protein",
                            subtitlle: "127 g",
                            editOntap: () {},
                            progressCurrentStep: 3,
                            progressbarColor: const Color(0xffFF9500),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomNutritionContainer(
                            title: "Carbs",
                            subtitlle: "181 g",
                            editOntap: () {},
                            progressCurrentStep: 4,
                            progressbarColor: const Color(0xffC5421B),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomNutritionContainer(
                            title: "Fats",
                            subtitlle: "45 g",
                            editOntap: () {},
                            progressCurrentStep: 2,
                            progressbarColor: const Color(0xff21ADF1),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: wColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 0),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: bColor.withOpacity(0.2))
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Health Score",
                                  style: buttonSubtitleTextStyles3.copyWith(
                                      color: bColor),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                new CircularPercentIndicator(
                                  backgroundColor: containerColor,
                                  radius: 30.0,
                                  lineWidth: 3.0,
                                  percent: 0.7,
                                  center: new Text("7/10"),
                                  progressColor: const Color(0xff9ACA0A),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 25.h,
                    ),
                    //container second
                    Container(
                      // height: 460.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: containerColor,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 4,
                                spreadRadius: 0,
                                color: bColor.withOpacity(0.2))
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Steps to achieve your objectives:",
                              style: buttonTextStyle.copyWith(
                                  color: primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          const DailySuggestionCustomContainer(
                            imagePath:
                                "assets/authentication/images/heart-shine_img.png",
                            text:
                                "Enhance your daily habits with a health score",
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const DailySuggestionCustomContainer(
                            imagePath:
                                "assets/authentication/images/food-apple_img.png",
                            text: "Monitor your meals",
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const DailySuggestionCustomContainer(
                            imagePath:
                                "assets/authentication/images/calories_img.png",
                            text: "Stay on track with your daily calorie goals",
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const DailySuggestionCustomContainer(
                            imagePath:
                                "assets/authentication/images/proteins_img.png",
                            text:
                                "Maintain a healthy ratio of carbs, proteins, and fat",
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Develop a plan informed by the listed sources and additional peer-reviewed medical studies:",
                      style: buttontitleTextStyles.copyWith(color: bColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "• Resting metabolic rate \n"
                      "• Harvard insights on tracking calories \n"
                      "• Global Association for Sports Nutrition \n"
                      "• NIH\n",
                      style: bodyTextStyle.copyWith(fontSize: 16.sp),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              NextButtonWidget(
                title: "Next",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TodayFreePaymentScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailySuggestionCustomContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  const DailySuggestionCustomContainer({
    required this.imagePath,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.only(
        left: 15.w,
        right: 8.w,
        top: 5.h,
        bottom: 10.h,
      ),
      // height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: wColor,
          //Color(0xffcea344),

          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
                color: bColor.withOpacity(0.2))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                height: 30.h,
                width: 30.w,
                fit: BoxFit.contain,
                imagePath,

                // "assets/authentication/images/heart-shine_img.png"
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  text,
                  // "Enhance your daily habits with a health score",
                  style: bodyTextStyle,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomNutritionContainer extends StatelessWidget {
  final String title;
  final String subtitlle;
  final Color progressbarColor;
  final VoidCallback editOntap;
  final int progressCurrentStep;

  CustomNutritionContainer({
    required this.title,
    required this.subtitlle,
    required this.progressbarColor,
    required this.editOntap,
    required this.progressCurrentStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.only(
        left: 15.w,
        right: 8.w,
        top: 5.h,
        bottom: 10.h,
      ),
      // height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: wColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
                color: bColor.withOpacity(0.2))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                subtitlle,
                style: buttonSubtitleTextStyles3.copyWith(color: bColor),
              ),
              SizedBox(
                width: 5.w,
              ),
              InkWell(
                onTap: editOntap,
                child: Icon(
                    color: bColor.withOpacity(0.25),
                    Icons.border_color_outlined),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text(title),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: LinearProgressBar(
                  maxSteps: 6,
                  progressType: LinearProgressBar
                      .progressTypeLinear, // Use Linear progress
                  currentStep: 5,
                  progressColor: progressbarColor,
                  backgroundColor: containerColor,
                  borderRadius: BorderRadius.circular(8.r), //  NEW
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
