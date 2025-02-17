import 'package:cal_ai/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback ontap;
  final Color color;
  final String title;
  final TextStyle textStyle;
  final height;
  final width;
  final TextAlign? align;
  final Color? borderColor;

  CustomButtonWidget({
    required this.ontap,
    required this.color,
    required this.title,
    required this.textStyle,
    this.borderColor,
    this.height,
    this.width,
    this.align,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(4.w),
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: borderColor ?? containerColor,width: 2),
            boxShadow: [
              BoxShadow(
                  color: bColor.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 0)),
            ],
          ),
          child: Text(
            textAlign: align,
            title,
            style: textStyle,
            //buttonTextStyle,
          )),
    );
  
  
  }
}
