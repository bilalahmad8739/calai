import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final String buttonText;
  final String paymentText;
  const BottomButtonWidget({
    required this.title,
    required this.buttonText,
    required this.paymentText,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      alignment: Alignment.center,
      height: 125.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, -4)),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Text(
            title,
            //"No Payment Needed at the Moment",
            style: bodyTextStyle,
          ),
          SizedBox(
            height: 5.h,
          ),
          GestureDetector(
            onTap: ontap,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              alignment: Alignment.center,
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                color: bColor,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Text(
                buttonText,
                style: buttonTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            paymentText,
            style: buttonSubtitleTextStyles3.copyWith(
                color: bColor.withOpacity(0.2)),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  
  
  }
}
