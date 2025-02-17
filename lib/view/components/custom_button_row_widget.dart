import 'package:cal_ai/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonRowWidget extends StatelessWidget {
  final VoidCallback ontap;
  final Color color;
  final String title;
  final String subTitle;
  final TextStyle textStyle;
  final TextStyle subTextStyle;
  final Color? borderColor;

  CustomButtonRowWidget({
    required this.ontap,
    required this.color,
    required this.title,
    required this.textStyle,
    required this.subTitle,
    required this.subTextStyle,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 25.h),
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(width: 2,color: borderColor ?? containerColor),
            boxShadow: [
              BoxShadow(
                  color: bColor.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 0)),
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
                Text(
                  title,
                  style: textStyle,
                  //buttonTextStyle,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  subTitle,
                  //"Just getting started or taking it slow",
                  style: subTextStyle,
                ),
              ],
            ),
          )),
    );
  
  
  }
}
