import 'dart:async';

import 'package:cal_ai/controllers/providers/auth_provider.dart';
import 'package:cal_ai/controllers/providers/food_info_provider.dart';
import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/homescreens/components/custom_container_homescreen.dart';
import 'package:cal_ai/view/screens/homescreens/components/recently_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class DailyTrackingScreen extends StatefulWidget {
  DailyTrackingScreen({Key? key}) : super(key: key);

  @override
  State<DailyTrackingScreen> createState() => _DailyTrackingScreenState();
}

class _DailyTrackingScreenState extends State<DailyTrackingScreen> {
  // late DailyTrackingScreenProvider homeProvider;
  Timer? _timer;
  DateTime? _selectDay;

  @override
  void initState() {
    super.initState();

    _selectDay = DateTime.now();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      final foodInfoProvider =
          Provider.of<FoodInfoProvider>(context, listen: false);

      authProvider.getUserData();
      foodInfoProvider.selectedDate = _selectDay;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthenticationProvider, FoodInfoProvider>(
      builder: (context, authProvider, foodInfoProvider, child) {
        print("remain calorie>${authProvider.remainingCalories}");
        print("daily screen");

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(

            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            backgroundColor: bgColor,
            elevation: 0,

            title: Row(
              children: [
                Image.asset(
                  "assets/home_screen/images/main_img.png",
                  height: 60.h, // Increased from 32.h
                      width: 60.w,  // Increased from 32.w
                      fit: BoxFit.contain,
                ),
                // SizedBox(width: 8.w), // Adjust spacing as needed
                Text('MacroPal AI',
                    style: titleTextStyless.copyWith(fontSize: 22.sp)),
              ],
            ),
            //Text(' MacroPal AI', style: titleTextStyless),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 23.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: bColor,
                    )),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                child: Row(
                  children: [
                    Text(
                      '7',
                      style: bodyTextStyle2,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                        height: 15.h,
                        width: 15.w,
                        fit: BoxFit.contain,
                        "assets/home_screen/images/fire_img.png")
                  ],
                ),
              ),
            ],
          ),
        
        
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  //calender
                  WeeklyDatePicker(
                    selectedDay: foodInfoProvider.selectedDate!,
                    changeDay: (value) {
                      setState(() {
                        _selectDay = value;
                      });

                      final foodInfoProvider =
                          Provider.of<FoodInfoProvider>(context, listen: false);

                      foodInfoProvider.selectedDate = value;
                      print("Date changed to: ${value.toString()}");
                    },
                    enableWeeknumberText: false,
                    weeknumberColor: Colors.blue,
                    weeknumberTextColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    selectedDigitBackgroundColor: bColor,
                    //selectedBackgroundColor: Colors.orange,
                    selectedDigitColor: Colors.white,
                    digitsColor: Colors.black,
                  ),
                  SizedBox(height: 50.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // print(
                              //     "calories${DailyTrackingScreenProvider.remainingCalories.toString()}");
                            },
                            child: CustomContianerHomeScreen(
                              verticalPadding: 25.h,
                              totalCalories: authProvider.remainingCalories
                                  .toStringAsFixed(2),
                              text: "Calories Remaining",
                              percentCircularWidget: CircularPercentIndicator(
                                percent: authProvider.calculateCaloriePercent(),
                                radius: 30,
                                progressColor: bColor,
                                center: Image.asset(
                                    height: 30.h,
                                    width: 30.w,
                                    fit: BoxFit.contain,
                                    "assets/home_screen/images/calories_img.png"),
                              ),
                              horizontalPadding: 10.w,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      // Column(
                      //   children: [
                      //     // proteins container
                      //     Container(
                      //       padding: EdgeInsets.symmetric(
                      //           vertical: 5.h, horizontal: 15.w),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10.r),
                      //           color: wColor,
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 offset: Offset(0, 0),
                      //                 blurRadius: 4,
                      //                 spreadRadius: 0,
                      //                 color: bColor.withOpacity(0.30))
                      //           ]),
                      //       child: Row(
                      //         children: [
                      //           Text(
                      //             "${authProvider.remainingProtein.toStringAsFixed(2)}",
                      //             // "177 g",
                      //             // "3000",
                      //             style: bodyTextStyle2.copyWith(
                      //                 color: primaryColor, fontSize: 14.sp),
                      //           ),
                      //           SizedBox(
                      //             width: 10.h,
                      //           ),
                      //           Text(
                      //             "Protein left  ",
                      //             //text,
                      //             style: containerTextStyle.copyWith(
                      //                 color: bColor, fontSize: 10.sp),
                      //           ),
                      //           SizedBox(
                      //             width: 20.h,
                      //           ),
                      //           CircularPercentIndicator(
                      //             percent:
                      //                 authProvider.calculateProteinPercent(),
                      //             // 0.3,
                      //             radius: 20,
                      //             progressColor: bColor,
                      //             center: Image.asset(
                      //                 height: 16.h,
                      //                 width: 16.w,
                      //                 fit: BoxFit.contain,
                      //                 "assets/home_screen/images/chicken_fast_img.png"),
                      //           ),
                      //           SizedBox(
                      //             height: 10.h,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 15.h,
                      //     ),

                      //     //carbs contianer

                      //     Container(
                      //       padding: EdgeInsets.symmetric(
                      //           vertical: 5.h, horizontal: 15.w),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10.r),
                      //           color: wColor,
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 offset: Offset(0, 0),
                      //                 blurRadius: 4,
                      //                 spreadRadius: 0,
                      //                 color: bColor.withOpacity(0.30))
                      //           ]),
                      //       child: Row(
                      //         children: [
                      //           Text(
                      //             "${authProvider.remainingCarbs.toStringAsFixed(2)}",

                      //             // "180 g",
                      //             // "3000",
                      //             style: bodyTextStyle2.copyWith(
                      //                 color: primaryColor, fontSize: 14.sp),
                      //           ),
                      //           SizedBox(
                      //             width: 10.h,
                      //           ),
                      //           Text(
                      //             "Carbs left    ",
                      //             //text,
                      //             style: containerTextStyle.copyWith(
                      //                 color: bColor, fontSize: 10.sp),
                      //           ),
                      //           SizedBox(
                      //             width: 20.h,
                      //           ),
                      //           CircularPercentIndicator(
                      //             percent: authProvider.calculateCarbsPercent(),
                      //             //0.7,
                      //             radius: 20,
                      //             progressColor: Colors.red,
                      //             center: Image.asset(
                      //                 height: 16.h,
                      //                 width: 16.w,
                      //                 fit: BoxFit.contain,
                      //                 "assets/home_screen/images/sprout_growing_img.png"),
                      //           ),
                      //           SizedBox(
                      //             height: 10.h,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 15.h,
                      //     ),
                      //     //fats container
                      //     Container(
                      //       padding: EdgeInsets.symmetric(
                      //            vertical: 5.h, horizontal: 20.w),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10.r),
                      //           color: wColor,
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 offset: Offset(0, 0),
                      //                 blurRadius: 4,
                      //                 spreadRadius: 0,
                      //                 color: bColor.withOpacity(0.30))
                      //           ]),
                      //       child: Row(
                      //         children: [
                      //           Text(
                      //             "${authProvider.remainingFats.toStringAsFixed(2)}",
                      //             //"85 g",
                      //             // "3000",
                      //             style: bodyTextStyle2.copyWith(
                      //                 color: primaryColor, fontSize: 14.sp),
                      //           ),
                      //           SizedBox(
                      //             width: 10.h,
                      //           ),
                      //           Text(
                      //             "Fat left      ",
                      //             //text,
                      //             style: containerTextStyle.copyWith(
                      //                 color: bColor, fontSize: 10.sp),
                      //           ),
                      //           SizedBox(
                      //             width: 20.h,
                      //           ),
                      //           CircularPercentIndicator(
                      //             percent: authProvider.calculateFatsPercent(),
                      //             radius: 20,
                      //             progressColor: Colors.amber,
                      //             center: Image.asset(
                      //                 height: 16.h,
                      //                 width: 16.w,
                      //                 fit: BoxFit.contain,
                      //                 "assets/home_screen/images/layer_img.png"),
                      //           ),
                      //           SizedBox(
                      //             height: 10.h,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // )
                   
                   
                    ],
                  ),



                  SizedBox(height: 20.h),

                  Text('Recently logged',
                      style: bodyTextStyle2.copyWith(color: primaryColor)),
                  SizedBox(height: 10.h),

//Fetch and display recently logged food data
                  Consumer<FoodInfoProvider>(
                    builder: (context, foodInfoProvider, child) {
                      print("selected data---->$_selectDay");
                      return StreamBuilder<List<Map<String, dynamic>>>(
                        stream: foodInfoProvider.getRecentlyLoggedFoodData(
                            foodInfoProvider.selectedDate!
                            ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text('No food data found');
                          } else {
                            final foodLogs = snapshot.data!;
                            print("foodlogs------------>${foodLogs.length}");
                            return Column(
                              children: foodLogs.map((foodData) {
                                return RecentlyCard(
                                  title: foodData['title'] ?? 'No Title',
                                  calories: '${foodData['calories']} calories',
                                  time: foodData['time'] ?? 'No Time',
                                  imagePath: foodData['imagePath'] ?? '',
                                  nutrientInfo: [
                                    {
                                      'iconPath':
                                          'assets/home_screen/images/chicken_fast_img.png',
                                      'value': '${foodData['proteins']} g'
                                    },
                                    {
                                      'iconPath':
                                          'assets/home_screen/images/sprout_growing_img.png',
                                      'value': '${foodData['carbs']} g'
                                    },
                                    {
                                      'iconPath':
                                          'assets/home_screen/images/layer_img.png',
                                      'value': '${foodData['fats']} g'
                                    },
                                  ],
                                  onTap: () {
                                    // Handle onTap
                                  },
                                );
                              }).toList(),
                            );
                          }
                        },
                      );
                    },
                  ),

                 
                
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
