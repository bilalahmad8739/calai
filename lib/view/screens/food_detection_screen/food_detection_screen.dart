import 'dart:io';

import 'package:cal_ai/controllers/providers/food_info_provider.dart';
import 'package:cal_ai/controllers/providers/general_provider.dart';
import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/utils/dialog_util.dart';
import 'package:cal_ai/view/screens/help_center_screen/help_center_screen.dart';
import 'package:cal_ai/view/screens/homescreen/daily_tracking_screen.dart';
import 'package:cal_ai/view/screens/homescreens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FoodDetectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("food detection screen");
    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Container(
      //     margin: EdgeInsets.only(left: 20.w, top: 15.h),
      //     // height: 35.h,
      //     // width: 35.w,
      //     decoration: BoxDecoration(shape: BoxShape.circle, color: btnColor),
      //     child: IconButton(
      //       icon: Icon(Icons.close, color: Colors.black),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      //   actions: [
      //     Container(
      //       alignment: Alignment.center,
      //       margin: EdgeInsets.only(right: 20.w, top: 15.h),
      //       decoration: BoxDecoration(shape: BoxShape.circle, color: btnColor),
      //       child: IconButton(
      //         icon: Icon(Icons.question_mark_outlined, color: Colors.black),
      //         onPressed: () {},
      //       ),
      //     ),
      //   ],
      // ),

      body: SafeArea(
        child: Stack(
          children: [
            // Display selected image
            Consumer<GeneralProvider>(
              builder: (context, generalProvider, child) {
                return Center(
                  child: generalProvider.image != null
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Image.file(
                            File(generalProvider.image!.path),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        )
                      : Text(
                          "No image selected",
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                );
              },
            ),

            // Center button
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Container(
                    height: 65.h,
                    width: 65.w,
                    child:
                        Consumer<FoodInfoProvider>(
                          builder: (context, foodInfoProvider, child) =>
                              FloatingActionButton(
                            shape: CircleBorder(),
                            onPressed: () async {
                              final dummyCalories = 700.0;
                              final dummyProteins = 90.0;
                              final dummyFats = 40.0;
                              final dummycarbs = 100.0;

                              final Map<String, dynamic> foodDetectionsData = {
                                'calories': dummyCalories,
                                'proteins': dummyProteins,
                                'fats': dummyFats,
                                'description': 'this is all for diet',
                                'imagePath': '',
                                'carbs': dummycarbs,
                                'title': 'Detected Apples',
                                'time': '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}'
                              };

                              print("Food detection data: $foodDetectionsData");
                              print("Using selected date: ${foodInfoProvider.selectedDate}");

                              await foodInfoProvider.postDetectFoodData(
                                foodDetectionsData,
                                context,
                                foodInfoProvider.selectedDate!,
                              );

                              // Navigate back to the DailyTrackingScreen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => DailyTrackingScreen()),
                              );
                            },
                            backgroundColor: wColor,
                            elevation: 4,
                          ),
                        ),

                    //     Consumer<FoodInfoProvider>(
                    //   builder: (context, foodInfoProvider, child) =>
                    //       FloatingActionButton(
                    //     shape: const CircleBorder(),
                    //     onPressed: () async {

                    //         // Navigator.pushReplacement(
                    //         //   context,
                    //         //   MaterialPageRoute(
                    //         //       builder: (context) => DailyTrackingScreen()),
                    //         // );
                    //       // try {
                    //       //   // First check if we have a selected date
                    //       //   if (foodInfoProvider.selectedDate == null) {
                    //       //     ScaffoldMessenger.of(context).showSnackBar(
                    //       //       const SnackBar(
                    //       //         content: Text('Please select a date first'),
                    //       //         duration: Duration(seconds: 2),
                    //       //       ),
                    //       //     );
                    //       //     return;
                    //       //   }

                    //       //   final dummyCalories = 700.0;
                    //       //   final dummyProteins = 90.0;
                    //       //   final dummyFats = 40.0;
                    //       //   final dummycarbs = 100.0;

                    //       //   final now = DateTime.now();
                    //       //   final formattedTime =
                    //       //       '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

                    //       //   final Map<String, dynamic> foodDetectionsData = {
                    //       //     'calories': dummyCalories,
                    //       //     'proteins': dummyProteins,
                    //       //     'fats': dummyFats,
                    //       //     'description': 'this is all for lose weight',
                    //       //     'imagePath': '',
                    //       //     'carbs': dummycarbs,
                    //       //     'title': 'Detected some fruits',
                    //       //     'time': formattedTime,
                    //       //     'dateLogged': foodInfoProvider.selectedDate!
                    //       //         .toIso8601String(),
                    //       //   };

                    //       //   print("Food detection data: $foodDetectionsData");
                    //       //   print(
                    //       //       "Selected date: ${foodInfoProvider.selectedDate}");

                    //       //   // Show loading indicator
                    //       //   // showDialog(
                    //       //   //   context: context,
                    //       //   //   barrierDismissible: false,
                    //       //   //   builder: (BuildContext context) {
                    //       //   //     return const Center(
                    //       //   //       child: CircularProgressIndicator(),
                    //       //   //     );
                    //       //   //   },
                    //       //   // );

                    //       //   // await foodInfoProvider.postDetectFoodData(
                    //       //   //     foodDetectionsData,
                    //       //   //     context,
                    //       //   //     foodInfoProvider.selectedDate!);

                    //       //   // Hide loading indicator
                    //       //   // Navigator.pop(context);

                    //       //   // Navigate to home screen
                    //       //   Navigator.pushReplacement(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //         builder: (context) => DailyTrackingScreen()),
                    //       //   );
                    //       // } catch (e) {
                    //       //   // Hide loading indicator if showing
                    //       //   if (Navigator.canPop(context)) {
                    //       //     //  Navigator.pop(context);
                    //       //   }

                    //       //   // Show error message
                    //       //   ScaffoldMessenger.of(context).showSnackBar(
                    //       //     SnackBar(
                    //       //       content: Text(
                    //       //           'Error saving food data: ${e.toString()}'),
                    //       //       duration: const Duration(seconds: 3),
                    //       //     ),
                    //       //   );
                    //       // }
                    //     },
                    //     backgroundColor: wColor,
                    //     elevation: 4,
                    //     // child: const Icon(Icons.add),
                    //   ),
                    // )
                    )
                    ,
              ),
            ),

            ///////////////////////////                        ///////////////////////////////////////

            // Bottom left rotation button
            Positioned(
              bottom: 40.h,
              left: 60.w,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                    color: wColor,
                    height: 30.h,
                    width: 30.w,
                    fit: BoxFit.contain,
                    "assets/food_detection/images/bolt_thunder_.png"),
              ),
            ),

            // Right-side buttons
            Consumer<GeneralProvider>(
              builder: (context, generalprovider, child) => Positioned(
                top: 230.h,
                right: 10.w,
                child: Column(
                  children: [
                    CustomActionButton(
                      ImagePath: "assets/food_detection/images/scan_img.png",
                      label: "Detect Food",
                      onTap: () {
                        UtilDialogs.show(context);
                      },
                    ),
                    SizedBox(height: 12.h),
                    CustomActionButton(
                      ImagePath:
                          "assets/food_detection/images/food_label_img.png",
                      label: "Food Label",
                      onTap: () {},
                    ),
                    SizedBox(height: 12.h),
                    CustomActionButton(
                      ImagePath: "assets/food_detection/images/barcode_img.png",
                      label: "Barcode",
                      onTap: () {},
                    ),
                    SizedBox(height: 12.h),
                    CustomActionButton(
                      ImagePath: "assets/food_detection/images/gallery_img.png",
                      label: "Gallery",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            /////////////////////            header row          //////////////////////////////////////////////
            Positioned(
              top: 20.h,
              left: 20.w, // Start from the left edge
              right: 20.w, // Extend to the right edge
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 28.w, // Adjust width
                    height: 28.w, // Keep it equal for a perfect circle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColor,
                    ),
                    child: Center(
                      // Ensures the icon is centered
                      child: SizedBox(
                        width: 18.w, // Set explicit size for the icon
                        height: 18.w,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close,
                                color: Colors.black, size: 16.sp)),
                      ),
                    ),
                  ),
                  Container(
                    width: 28.w, // Adjust width
                    height: 28.w, // Keep it equal for a perfect circle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColor,
                    ),
                    child: Center(
                      // Ensures the icon is centered
                      child: SizedBox(
                        width: 18.w, // Set explicit size for the icon
                        height: 18.w,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpCentreScreen()));
                          },
                          child: Icon(Icons.question_mark_outlined,
                              color: Colors.black, size: 16.sp),
                        ),
                      ),
                    ),
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

class CustomActionButton extends StatelessWidget {
  final String ImagePath;
  final String label;
  final VoidCallback onTap;

  const CustomActionButton({
    Key? key,
    required this.ImagePath,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: 80.w,
        //padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Color(0xffF0EEEE),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: bColor.withOpacity(0.2),
              blurRadius: 4.r,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Image.asset(
                height: 25.h, width: 25.w, fit: BoxFit.contain, ImagePath),
            SizedBox(width: 10.w),
            Text(
              label,
              style: buttonSubtitleTextStyles3.copyWith(
                  color: bColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
