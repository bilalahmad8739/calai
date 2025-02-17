import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/save_food_screen/save_food_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItemScreen extends StatelessWidget {
  const FavoriteItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      // margin: EdgeInsets.only(left: 15.w, top: 15.h),
                      height: 35.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: btnColor),
                      child: Image.asset(
                          height: 25.h,
                          width: 25.w,
                          fit: BoxFit.contain,
                          "assets/authentication/images/arrow_back_img.png"),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Choose from favourite",
                    style: headerTextStyles,
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              Text(
                "Favourite Items",
                style: titleTextStyless,
              ),
              SizedBox(
                height: 15.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SaveFoodScreen(imagePath: ""),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Click the  ",
                          style: bodyTextStyle,
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment
                              .middle, // Ensures vertical alignment
                          child: Image.asset(
                            "assets/food_detection/images/save_img.png", // Replace with your image path
                            width: 16.w, // Adjust width
                            height: 16.h, // Adjust height
                          ),
                        ),
                        TextSpan(
                          text:
                              "  button to save the food while editing the log.",
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center, // Ensures center alignment
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          //  Image.asset("assets/food_detection/images/save_img.png")
        ),
      ),
    );
  }
}
