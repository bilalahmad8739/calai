import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NextButtonWidget extends StatelessWidget {
  String title;
  final VoidCallback ontap;
  final bool loading;
  NextButtonWidget({
    required this.title,
    required this.ontap,
    this.loading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 93.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
        boxShadow: [
          BoxShadow(
              color: bColor.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 2)),
        ],
      ),
      child: GestureDetector(
        onTap: loading ? null : ontap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              alignment: Alignment.center,
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: loading
                  ? LoadingAnimationWidget.waveDots(
                      color: Colors.white, size: 20)
                  : Text(
                      title,
                      style: buttonTextstyles.copyWith(color: containerColor),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
