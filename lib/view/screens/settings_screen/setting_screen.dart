import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/authentication/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import 'package:linear_progress_bar/ui/dots_indicator.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool locationEnabled = false;
  bool notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dark Mode Toggle (Moon Icon)
              Row(
                children: [
                  Image.asset(
                      height: 32.h,
                      width: 32.w,
                      fit: BoxFit.contain,
                      "assets/home_screen/images/main_img.png"),

                  Spacer(),
                  // Title
                  Text("Settings", style: headerTextStyles),

                  Spacer(),
                ],
              ),
              SizedBox(height: 30.h),

              // User Profile Section
              Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4.r,
                        spreadRadius: 0,
                        offset: Offset(0, 0)),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35.r,
                      backgroundImage: AssetImage(
                          "assets/authentication/images/rating_person_img.png"), // Replace with user image
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Huzaifa Shah",
                            style: buttonSubtitleTextStyles.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: bColor)),
                        Text("huzaifashah@gmail.com",
                            style: buttonSubtitleTextStyles.copyWith(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: bColor)),
                      ],
                    ),
                    const Spacer(),
                    CustomForwordContainer(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen()));
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              // Settings Options
              _buildSettingOption(
                "assets/settings/images/language_img.png",
                "Language",
                () {},
              ),

              _buildToggleOption("assets/settings/images/location_img.png",
                  "Location", locationEnabled, (value) {
                setState(() {
                  locationEnabled = value;
                });
              }, () {}),
              _buildToggleOption("assets/settings/images/notification_img.png",
                  "Notifications", notificationsEnabled, (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              }, () {}),
              _buildSettingOption(
                  "assets/settings/images/help_img.png", "Help Centre", () {}),
              _buildSettingOption(
                  "assets/settings/images/logout_img.png", "Log Out", () {}),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for settings with icons and navigation
  Widget _buildSettingOption(
      String imagepath, String title, VoidCallback ontap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          _buildIcon(imagepath, ontap),
          SizedBox(width: 23.w),
          Text(
            title,
            style: bodyTextStyle.copyWith(fontSize: 16.sp),
          ),
          Spacer(),
          CustomForwordContainer(
            ontap: () {},
          )
        ],
      ),
    );
  }

  // Widget for settings with toggle switch
  Widget _buildToggleOption(String imagepath, String title, bool value,
      Function(bool) onChanged, VoidCallback ontap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          _buildIcon(imagepath, ontap),
          SizedBox(width: 23.w),
          Text(
            title,
            style: bodyTextStyle,
          ),
          Spacer(),
          Switch(
            inactiveThumbImage:
                AssetImage("assets/settings/images/thumb_icon.png"),

            thumbColor: MaterialStateProperty.all(wColor),
            activeThumbImage:
                AssetImage("assets/settings/images/thumb_icon.png"),

            trackColor: MaterialStateProperty.all(primaryColor),
            value: value,
            onChanged: onChanged,
            //activeColor: Colors.black,
          ),
        ],
      ),
    );
  }

  // Widget for the left-side icons
  Widget _buildIcon(String imagepath, VoidCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Image.asset(
          height: 40.h,
          width: 40.w,
          fit: BoxFit.contain,
          imagepath,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CustomForwordContainer extends StatelessWidget {
  final VoidCallback ontap;
  const CustomForwordContainer({
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Image.asset(
          height: 30.h,
          width: 30.w,
          fit: BoxFit.contain,
          "assets/settings/images/forword_icon.png"),
    );
  }
}
