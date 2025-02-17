import 'package:cal_ai/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderRow extends StatelessWidget {
  final String image;
  HeaderRow({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(shape: BoxShape.circle, color: btnColor),
            child: Image.asset(
                height: 25.h,
                width: 25.w,
                fit: BoxFit.contain,
                "assets/authentication/images/arrow_back_img.png"),
          ),
        ),
        SizedBox(
          width: 30.w,
        ),
        Image.asset(fit: BoxFit.contain, height: 25.h, width: 208.w, image)
      ],
    );
  }
}
