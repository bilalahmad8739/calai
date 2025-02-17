import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String icon;
  final Color backgroundColor;

  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(
              color: Colors.grey[300]!,
              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                icon,
                height: 24.h,
                width: 24.w,
              ),
              Spacer(),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
