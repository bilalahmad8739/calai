import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentlyCard extends StatelessWidget {
  final String title;
  final String calories;
  // final String details;
  final String time;
  final double? height;
  final double? width;
  final String imagePath;
  final List<Map<String, String>>
      nutrientInfo; // [{iconPath: '...', value: '8 g'}]
  final VoidCallback onTap;

  const RecentlyCard({
    Key? key,
    required this.title,
    required this.calories,
    // required this.details,
    required this.time,
     this.height,
     this.width,
    required this.imagePath,
    required this.nutrientInfo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image Section
            imagePath.isNotEmpty
                ? Image.asset(
                    imagePath,
                    height:height,
                    width: width,
                    fit: BoxFit.contain,
                  )
                : SizedBox(),

            // Details Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Time Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(title,
                            style: bodyTextStyle2.copyWith(
                                fontWeight: FontWeight.w400)),
                      ),
                      Text(time,
                          style: buttonSubtitleTextStyles2.copyWith(
                              fontSize: 12.sp)),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  // Calories Row
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.orange,
                        size: 18.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(calories,
                          style: bodyTextStyle2.copyWith(
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  // Nutrients Row
                  Row(
                    children: nutrientInfo.map((nutrient) {
                      return Row(
                        children: [
                          Image.asset(
                            nutrient['iconPath']!,
                            height: 16.h,
                            width: 16.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            nutrient['value']!,
                            style: buttonSubtitleTextStyles.copyWith(
                                fontWeight: FontWeight.w400, color: bColor),
                          ),
                          SizedBox(width: 8.w), // Space between nutrients
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
