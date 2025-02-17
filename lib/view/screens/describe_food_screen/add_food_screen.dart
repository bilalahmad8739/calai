import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFoodScreen extends StatelessWidget {
  const AddFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
        resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          //margin: EdgeInsets.only(left: 15.w, top: 15.h),
                          height: 35.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: btnColor,
                          ),
                          child: Image.asset(
                            height: 25.h,
                            width: 25.w,
                            fit: BoxFit.contain,
                            "assets/authentication/images/arrow_back_img.png",
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Describe Your Food",
                        style: headerTextStyles,
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 200.h), // Added spacing
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Describe your meal",
                          hintStyle: bodyTextStyle.copyWith(
                              color: bColor.withOpacity(0.25)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide:
                                BorderSide(color: primaryColor, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: Container(
                      height: 80.h,
                      width: 80.w,
                      // padding: EdgeInsets.only(
                      //   top: 15.h,
                      //   bottom: 10.h,
                      // ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: bColor.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Adjust size
                        children: [
                          Image.asset(
                            height: 25.h,
                            width: 25.w,
                            fit: BoxFit.contain,
                            color: wColor,
                            "assets/food_detection/images/stars_img.png",
                          ),
                          Text(
                            "AI",
                            style: buttonSubtitleTextStyles.copyWith(
                              fontSize: 20.sp,
                              color: bgColor,
                            ),
                          ),
                          Text(
                            "Generate",
                            style: buttonSubtitleTextStyles.copyWith(
                                color: bgColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(), // Moved Spacer to the outer Column
            NextButtonWidget(
              ontap: () {},
              title: "Add Food",
            ),
          ],
        ),
      ),
    );
  }
}
