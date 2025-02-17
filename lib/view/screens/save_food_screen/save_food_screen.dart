import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveFoodScreen extends StatefulWidget {
  final String imagePath;

  SaveFoodScreen({
    required this.imagePath,
  });
  @override
  State<SaveFoodScreen> createState() => _SaveFoodScreenState();
}

class _SaveFoodScreenState extends State<SaveFoodScreen> {
  int _counter = 1; // Initial value of the counter

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,

      //bgColor,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffd0d1cc),
              image: DecorationImage(
                  image: AssetImage("assets/home_screen/images/glass_img.png"
                      //widget.imagePath,
                      ),
                  fit: BoxFit.cover),
              // color: Colors.blue,
            ),
            child: Column(
              children: [
                Spacer(),
                Container(
                  height: 600.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: bColor.withOpacity(0.25),
                          blurRadius: 4.r,
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.h),
                          topRight: Radius.circular(32.w))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12.h,
                            ),
                            //row for header
                            Row(
                              children: [
                                Text(
                                  "10:26",
                                  style: bodyTextStyle,
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                          height: 25.h,
                                          width: 25.w,
                                          fit: BoxFit.contain,
                                          "assets/food_detection/images/share_img.png"),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                          height: 25.h,
                                          width: 25.w,
                                          fit: BoxFit.contain,
                                          "assets/food_detection/images/save_img.png"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 13.h,
                            ),

                            /////////////////////////////////////////////////////////////////////////////////
                            Row(
                              children: [
                                Text("Milk Glass",
                                    style: titleTextStyless.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor)),
                                Spacer(),
                                Container(
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: 50.w, vertical: 50.h),
                                  height: 60.h,
                                  width: 60.w, // Fixed width to match design
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    //  color: Colors.blue,
                                    //wColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: bColor.withOpacity(0.25),
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      // Number Display (Left Side)
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12.r),
                                                bottomLeft:
                                                    Radius.circular(12.r)),
                                            color: Colors.white,
                                          ),
                                          alignment: Alignment.center,
                                          // Ensure left side is white
                                          child: Text(
                                            '$_counter',
                                            style: bodyTextStyle2.copyWith(
                                              fontSize: 16
                                                  .sp, // Slightly larger font for better visibility
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Arrows Container (Right Side)
                                      Container(
                                        width:
                                            25.w, // Fix width for arrow section
                                        decoration: BoxDecoration(
                                          color: Colors.grey[
                                              200], // Light grey background
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12.r),
                                            bottomRight: Radius.circular(12.r),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: _increaseCounter,
                                              child: Icon(
                                                Icons.expand_less, // Up arrow
                                                size: 25.sp,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: _decreaseCounter,
                                              child: Icon(
                                                Icons.expand_more, // Down arrow
                                                size: 25.sp,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            SizedBox(
                              height: 20.h,
                            ),
                            // gradview
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32.w),
                              child: GridView.count(
                                padding: EdgeInsets.zero,
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                crossAxisSpacing: 20.w,
                                mainAxisSpacing: 20.h,
                                children: [
                                  NutrientCustomContainer(
                                    editTap: () {},
                                    editIcon: Icons.border_color_outlined,
                                    title: "Calories",
                                    imagePath:
                                        "assets/home_screen/images/calories_img.png",
                                    value: "160",
                                    unit: "",
                                  ),
                                  NutrientCustomContainer(
                                    editTap: () {},
                                    editIcon: Icons.border_color_outlined,
                                    imagePath:
                                        "assets/home_screen/images/sprout_growing_img.png",
                                    title: "Carbs",
                                    value: "10",
                                    unit: "g",
                                  ),
                                  NutrientCustomContainer(
                                    editTap: () {},
                                    editIcon: Icons.border_color_outlined,
                                    imagePath:
                                        "assets/home_screen/images/chicken_fast_img.png",
                                    title: "Protein",
                                    value: "15",
                                    unit: "g",
                                  ),
                                  NutrientCustomContainer(
                                    editTap: () {},
                                    editIcon: Icons.border_color_outlined,
                                    imagePath:
                                        "assets/home_screen/images/layer_img.png",
                                    title: "Fat",
                                    value: "18",
                                    unit: "g",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30.h),
                            Container(
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: wColor,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      color: bColor.withOpacity(0.2),
                                    )
                                  ]),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 20.w, right: 10.w),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        height: 26.h,
                                        width: 26.w,
                                        fit: BoxFit.contain,
                                        "assets/food_detection/images/heart_shine_img.png"),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "Fitness Rating",
                                      style: bodyTextStyle2.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                        height: 15.h,
                                        width: 15.w,
                                        fit: BoxFit.contain,
                                        "assets/food_detection/images/star_half_rating.png"),
                                    Text("7/10",
                                        style: buttontitleTextStyles.copyWith(
                                            color: bColor)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///////////////////////////////////    //////////////////////////////////////////////

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              //: 110.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, -4)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: wColor,
                          boxShadow: [
                            BoxShadow(
                              color: bColor.withOpacity(0.25),
                              offset: Offset(0, 0),
                              blurRadius: 4.r,
                              spreadRadius: 0,
                            ),
                          ]),
                      child: Row(
                        children: [
                          Image.asset(
                              height: 25.h,
                              width: 25.w,
                              fit: BoxFit.contain,
                              "assets/food_detection/images/stars_img.png"),
                          Text("Refine outputs",
                              style: buttonTextstyles.copyWith(
                                  color: bColor, fontSize: 14.sp))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        height: 40.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: bColor,
                            boxShadow: [
                              BoxShadow(
                                color: bColor.withOpacity(0.2),
                                offset: Offset(0, 0),
                                blurRadius: 4.r,
                                spreadRadius: 0,
                              ),
                            ]),
                        child: Text("Save",
                            style: buttonTextstyles.copyWith(
                                color: wColor, fontSize: 14.sp))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NutrientCustomContainer extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String imagePath;
  final VoidCallback editTap;
  final IconData editIcon;

  const NutrientCustomContainer({
    required this.editTap,
    required this.editIcon,
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 120.w,
      // padding: EdgeInsets.all(12.w),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4.r,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 7.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                    height: 30.h, width: 30.w, fit: BoxFit.contain, imagePath),
                SizedBox(
                  width: 15.w,
                ),
                InkWell(
                  onTap: editTap,
                  child: Icon(
                    editIcon,
                    color: bColor.withOpacity(0.25),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Text(title,
              style: bodyTextStyle2.copyWith(fontWeight: FontWeight.w500)),
          SizedBox(height: 6.h),
          Text(
            "$value $unit",
            style: bodyTextStyle2.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
