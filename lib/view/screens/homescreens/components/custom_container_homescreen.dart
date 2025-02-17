import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContianerHomeScreen extends StatelessWidget {
  final String totalCalories;
  final String text;
  final Widget percentCircularWidget;

  final double verticalPadding;
  final double horizontalPadding;

  const CustomContianerHomeScreen({
    required this.totalCalories,
    required this.text,
    required this.percentCircularWidget,
    required this.horizontalPadding,
    required this.verticalPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: wColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
                color: bColor.withOpacity(0.30))
          ]),
      child: Column(
        children: [
          Text(
            totalCalories,
            // "3000",
            style: bodyTextStyle2.copyWith(color: primaryColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            // "Calories Remaining",
            text,
            style: containerTextStyle.copyWith(color: bColor, fontSize: 8.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          percentCircularWidget,
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
