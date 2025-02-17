import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_fitness_goal_selection_screen.dart';
import 'package:cal_ai/view/screens/payment_screens/payme;nt_components/payment_custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpDietSelectionScreen extends StatefulWidget {
  late Map<String, dynamic> data;

  SignUpDietSelectionScreen({
    required this.data,
  });

  @override
  _SignUpDietSelectionScreenState createState() =>
      _SignUpDietSelectionScreenState();
}

class _SignUpDietSelectionScreenState extends State<SignUpDietSelectionScreen> {
  String _selectedDiet = "Vegetables";

  // List of diet options
  // final List<String> _diets = [
  //   "Vegetables",
  //   "Fruits",
  //   "Lean proteins",
  //   "Whole grains",
  //   "Healthy fats",
  //   "Legumes",
  // ];

  // Mapping diet options to image paths
  // Mapping diet options to image paths
  final Map<String, String> _dietImages = {
    "Vegetables": "assets/authentication/images/tomato.png",
    "Fruits": "assets/authentication/images/fruits.png",
    "Lean proteins": "assets/authentication/images/protein.png",
    "Whole grains": "assets/authentication/images/grains.png",
    "Healthy fats": "assets/authentication/images/healthy_fats.png",
    "Legumes": "assets/authentication/images/beans.png",
  };

  @override
  Widget build(BuildContext context) {
    print("Diet Selection Screen Data: ${widget.data.toString()}");

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderRow(
                        image: "assets/authentication/images/line9_img.png"),
                    SizedBox(height: 25.h),
                    Text(
                      textAlign: TextAlign.center,
                      "Do you adhere to a particular diet plan?",
                      style: titleTextStyless,
                    ),
                    SizedBox(height: 70.h),
                    Column(
                      children: _dietImages.keys.map((diet) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: 25.h, left: 10.w, right: 10.w),
                          child: PaymentCustomContainerWidget(
                            containerBorderColor:
                                _selectedDiet == diet ? bColor : containerColor,
                            textStyle: bodyTextStyle.copyWith(
                                fontSize: 14.sp, color: bColor),
                            imagePath: _dietImages[diet] ??
                                "assets/authentication/images/default.png",
                            text: diet,
                            ontap: () {
                              setState(() {
                                _selectedDiet = diet;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 80.h), // Extra padding for button
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: bgColor, // Optional background color for the button area
                child: NextButtonWidget(
                  title: "Next",
                  ontap: () {
                    widget.data['selectedDiet'] = _selectedDiet;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpFitnessGoalSelectionScreen(
                          data: widget.data,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonRowWidget extends StatelessWidget {
  String title;
  final VoidCallback ontap;
  final Color containeColor;
  final String imagepath;
  final Color imageColor;
  final Color titleColor;
  CustomButtonRowWidget({
    required this.title,
    required this.ontap,
    required this.containeColor,
    required this.imagepath,
    required this.imageColor,
    required this.titleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 15.h),
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: containeColor,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                  color: bColor.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 3)),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 10.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:
                  CrossAxisAlignment.baseline, // Align based on baseline
              textBaseline: TextBaseline.alphabetic,
              children: [
                Image.asset(
                    color: imageColor,
                    height: 25.h,
                    width: 25.w,
                    fit: BoxFit.contain,
                    imagepath),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  title,
                  //"Just getting started or taking it slow",
                  style: buttonTextStyle.copyWith(color: titleColor),
                ),
              ],
            ),
          )),
    );
  }
}
