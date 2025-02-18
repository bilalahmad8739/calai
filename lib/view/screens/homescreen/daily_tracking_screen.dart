import 'dart:async';

import 'package:cal_ai/controllers/providers/auth_provider.dart';
import 'package:cal_ai/controllers/providers/food_info_provider.dart';
import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/homescreens/components/custom_container_homescreen.dart';
//import 'package:cal_ai/view/screens/homescreens/components/custom_container_homescreen.dart';
import 'package:cal_ai/view/screens/homescreens/components/recently_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:percent_indicator/circular_percent_indicator.dart';
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
    
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
      final foodInfoProvider = Provider.of<FoodInfoProvider>(context, listen: false);

      // Load user data and today's nutrients
      await authProvider.getUserData();
      foodInfoProvider.selectedDate = _selectDay;
      
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("daily tracking screen");
    return Consumer2<AuthenticationProvider, FoodInfoProvider>(
      builder: (context, authProvider, foodInfoProvider, child) {
        // Ensure selectedDate is not null
        final selectedDate = foodInfoProvider.selectedDate ?? DateTime.now();
        print("percent------>${authProvider.remainingCalories}");
        print("fetch data --------------->${authProvider.userData}");

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: bgColor,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Image.asset(
                  height: 32.h,
                  width: 32.w,
                  fit: BoxFit.contain,
                  "assets/home_screen/images/main_img.png"),
            ),
            title: Text(' MacroPal AI',
                style: titleTextStyles.copyWith(color: btnColor)),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 23.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: bColor,
                    )),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
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
                  SizedBox(height: 50.h),
                  //calender
                  WeeklyDatePicker(
                    selectedDay: selectedDate,
                    changeDay: (value)  {
                      print("onchange work");
                      // print('Date changed to ----------: ${value.toString()}');
                      final authProvider =
                          Provider.of<AuthenticationProvider>(context, listen: false);
                      print("first ---->${authProvider.calorieGoal.toString()}");
                      // print("first ---->0000000");

                      
                      setState(() {
                        _selectDay = value;
                      });

                      final foodInfoProvider =
                          Provider.of<FoodInfoProvider>(context, listen: false);
                      

                      foodInfoProvider.selectedDate = value;
                   //   await authProvider.loadConsumedNutrientsForDate(value);
                        print("Date changed to: ${value.toString()}");
                      
                      if (mounted) {
                        setState(() {});
                      }
                      print("last ---->${authProvider.calorieGoal.toString()}");
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
                 
                //  WeeklyDatePicker(selectedDay: _selectDay!, changeDay: (value){

                //   print("change-------------->");
                //  }),
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
                              verticalPadding: 40.h,
                              totalCalories: authProvider.remainingCalories.toString(),
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
                     
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: wColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: bColor.withOpacity(0.25))
                                ]),
                            child: Row(
                              children: [
                                Text(
                                  "${authProvider.remainingProtein.toStringAsFixed(2)}",
                                  style: bodyTextStyle2.copyWith(
                                      color: btnColor, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Text(
                                  "Protein left",
                                  style: containerTextStyle.copyWith(
                                      color: bColor, fontSize: 10.sp),
                                ),
                                SizedBox(
                                  width: 20.h,
                                ),
                                CircularPercentIndicator(
                                  percent:
                                      authProvider.calculateProteinPercent(),
                                  radius: 20,
                                  progressColor: bColor,
                                  center: Image.asset(
                                      height: 16.h,
                                      width: 16.w,
                                      fit: BoxFit.contain,
                                      "assets/home_screen/images/chicken_fast_img.png"),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: wColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: bColor.withOpacity(0.25))
                                ]),
                            child: Row(
                              children: [
                                Text(
                                  "${authProvider.remainingCarbs.toStringAsFixed(2)}",
                                  style: bodyTextStyle2.copyWith(
                                      color: btnColor, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Text(
                                  "Carbs left",
                                  style: containerTextStyle.copyWith(
                                      color: bColor, fontSize: 10.sp),
                                ),
                                SizedBox(
                                  width: 20.h,
                                ),
                                CircularPercentIndicator(
                                   percent: authProvider.calculateCarbsPercent(),
                                  radius: 20,
                                  progressColor: Colors.red,
                                  center: Image.asset(
                                      height: 16.h,
                                      width: 16.w,
                                      fit: BoxFit.contain,
                                      "assets/home_screen/images/sprout_growing_img.png"),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 22.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: wColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: bColor.withOpacity(0.25))
                                ]),
                            child: Row(
                              children: [
                                Text(
                                  "${authProvider.remainingFats.toStringAsFixed(2)}",
                                  style: bodyTextStyle2.copyWith(
                                      color: btnColor, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Text(
                                  "Fat left",
                                  style: containerTextStyle.copyWith(
                                      color: bColor, fontSize: 10.sp),
                                ),
                                SizedBox(
                                  width: 20.h,
                                ),
                                CircularPercentIndicator(
                                  percent: authProvider.calculateFatsPercent(),
                                  radius: 20,
                                  progressColor: Colors.amber,
                                  center: Image.asset(
                                      height: 16.h,
                                      width: 16.w,
                                      fit: BoxFit.contain,
                                      "assets/home_screen/images/layer_img.png"),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  
                  
                    ],
                  ),



                  SizedBox(height: 20.h),

                  Text('Recently logged',
                      style: bodyTextStyle2.copyWith(color: btnColor)),
                  SizedBox(height: 10.h),

// Fetch and display recently logged food data
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
                                  calories: '${(foodData['calories'] as num).toStringAsFixed(1)} calories',
                                  time: foodData['time'] ?? 'No Time',
                                  imagePath: foodData['imagePath'] ?? '',
                                  nutrientInfo: [
                                    {
                                      'iconPath': 'assets/home_screen/images/chicken_fast_img.png',
                                      'value': '${(foodData['proteins'] as num).toStringAsFixed(1)} g'
                                    },
                                    {
                                      'iconPath': 'assets/home_screen/images/sprout_growing_img.png',
                                      'value': '${(foodData['carbs'] as num).toStringAsFixed(1)} g'
                                    },
                                    {
                                      'iconPath': 'assets/home_screen/images/layer_img.png',
                                      'value': '${(foodData['fats'] as num).toStringAsFixed(1)} g'
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