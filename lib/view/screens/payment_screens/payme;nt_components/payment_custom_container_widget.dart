import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentCustomContainerWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color containerBorderColor;
  final VoidCallback ontap;
  final TextStyle textStyle;
  PaymentCustomContainerWidget({
    required this.ontap,
    required this.imagePath,
    required this.text,
    required this.textStyle,
    this.containerBorderColor = bColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        
        //height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: containerColor,
          border: Border.all(color: containerBorderColor, width: 2),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 4.r,
              color: bColor.withOpacity(0.25),
              spreadRadius: 0.r,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 4.r,
                    color: bColor.withOpacity(0.25),
                    spreadRadius: 0.r,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  color: wColor,
                  imagePath,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
