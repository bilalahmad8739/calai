import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/authentication/signup_date_of_birth_selection_screen.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SignUpHeightWeightSelectionScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const SignUpHeightWeightSelectionScreen({required this.data, super.key});

  @override
  State<SignUpHeightWeightSelectionScreen> createState() =>
      _SignUpHeightWeightSelectionScreenState();
}

class _SignUpHeightWeightSelectionScreenState
    extends State<SignUpHeightWeightSelectionScreen> {
  bool isSwitched = false;
  int height = 1;
  int inches = 1;
  int weight = 80;
  int kg = 1;
  int cm = 180;

  // Function to decrease cm
  void decreaseCm() {
    setState(() {
      if (cm > 0) {
        cm--; // Decrease cm value
      }
    });
  }

  //function to increase cm
  void increaseCm() {
    setState(() {
      cm++; // Increase cm value
    });
  }

  // Function to decrease kg
  void decreaseKg() {
    setState(() {
      if (kg > 0) {
        kg--; // Decrease kg value
      }
    });
  }

  //function to increase kg
  void increaseKg() {
    setState(() {
      kg++; // Increase kg value
    });
  }

  // Function to decrease weight
  void decreaseWeight() {
    setState(() {
      if (weight > 0) {
        weight--; // Decrease weight value
      }
    });
  }

  // Function to increase weight
  void increaseWeight() {
    setState(() {
      weight++; // Increase weight value
    });
  }

  // Function to decrease inches
  void decreaseinche() {
    setState(() {
      if (inches > 0) {
        inches--; // Decrease height value
      }
    });
  }

  // Function to increase inches
  void increaseinche() {
    setState(() {
      inches++; // Increase height value
    });
  }

  void decreaseHeight() {
    setState(() {
      if (height > 0) {
        height--; // Decrease height value
      }
    });
  }

  // Function to increase height
  void increaseHeight() {
    setState(() {
      height++; // Increase height value
    });
  }

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
      print("switch------>$isSwitched");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("heiht and with ------------------>${widget.data}");
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderRow(
                      image: "assets/authentication/images/line5_img.png"),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Height & Weight",
                      style: titleTextStyless,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "This activity level helps you to tailor your fitness insights!",
                      style: bodyTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),

                  ////////////////////////// padding of switch row //////////////////////////////////

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Track in Pounds and Inches",
                              style: buttontitleTextStyles.copyWith(
                                  color: isSwitched == false
                                      ? bColor
                                      //
                                      : bColor.withOpacity(0.2)),
                            )),
                            SizedBox(
                              width: 10.w,
                            ),

                            // NeumorphicSwitch(),

                            Switch(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeTrackColor: bColor,
                                activeColor: wColor,
                                value: isSwitched,
                                onChanged: _toggleSwitch),
                            SizedBox(width: 7.w),

                            Expanded(
                                child: Text(
                              "Kilograms and Centimeters",
                              style: buttontitleTextStyles.copyWith(
                                  color: isSwitched == true
                                      ? bColor
                                      : bColor.withOpacity(0.2)),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        //for height and weight in pounds and inches
                        isSwitched == false
                            ? 
                            Row(
                                children: [
                                  // Height Column
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Height",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                          height: 20
                                              .h),
                                               // Space between label and values
                                      Row(
                                        children: [
                                          //ft container
                                          Container(
                                            // //height: 170.h,
                                            width: 60.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  32.r,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: bColor
                                                          .withOpacity(0.21),
                                                      offset: Offset(0, 0),
                                                      blurRadius: 2,
                                                      spreadRadius: 0)
                                                ],
                                                color: wColor),
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    decreaseHeight();
                                                  },
                                                  child: const Icon(
                                                      size: 40,
                                                      Icons
                                                          .keyboard_arrow_up_outlined),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 80.h,
                                                  width: double.infinity,
                                                  color: btnColor,
                                                  child: Text(
                                                    "$height FT",
                                                    style: const TextStyle(
                                                        fontSize: 14.0),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    increaseHeight();
                                                  },
                                                  child: const Icon(
                                                      size: 40,
                                                      Icons
                                                          .keyboard_arrow_down_outlined),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                              width: 20
                                                  .w), // Space between "5FT" and "9IN"
                                          Container(
                                            // //height: 170.h,
                                            width: 60.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  32.r,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(0, 0),
                                                      blurRadius: 4,
                                                      spreadRadius: 0,
                                                      color: bColor
                                                          .withOpacity(0.4))
                                                ],
                                                color: wColor),
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    decreaseinche();
                                                  },
                                                  child: const Icon(
                                                      size: 40,
                                                      Icons
                                                          .keyboard_arrow_up_outlined),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 80.h,
                                                  width: double.infinity,
                                                  color: btnColor,
                                                  child: Text(
                                                    "$inches in",
                                                    style: const TextStyle(
                                                        fontSize: 14.0),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    increaseinche();
                                                  },
                                                  child: const Icon(
                                                      size: 40,
                                                      Icons
                                                          .keyboard_arrow_down_outlined),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                   
                                   
                                    ],
                                  ),
                                  const Spacer(),
                                  // Weight Column
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Weight",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                          height:
                                              20.0), // Space between label and value
                                      Container(
                                        //height: 170.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              32.r,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      bColor.withOpacity(0.21),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 2,
                                                  spreadRadius: 0)
                                            ],
                                            color: wColor),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                decreaseWeight();
                                              },
                                              child: const Icon(
                                                  size: 40,
                                                  Icons
                                                      .keyboard_arrow_up_outlined),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 80.h,
                                              width: double.infinity,
                                              color: btnColor,
                                              child: Text(
                                                "$weight b",
                                                style: const TextStyle(
                                                    fontSize: 14.0),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                increaseWeight();
                                              },
                                              child: const Icon(
                                                  size: 40,
                                                  Icons
                                                      .keyboard_arrow_down_outlined),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : //for height and weigth in centimeter kilogram







                            Row(
                                children: [
                                  // Height Column
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Height",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                          height: 20
                                              .h), // Space between label and values
                                      Container(
                                        //height: 170.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(
                                              32.r,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset:
                                                      const Offset(0, 0),
                                                  blurRadius: 4,
                                                  spreadRadius: 0,
                                                  color: bColor
                                                      .withOpacity(0.4))
                                            ],
                                            color: wColor),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                decreaseCm();
                                              },
                                              child: const Icon(
                                                  size: 40,
                                                  Icons
                                                      .keyboard_arrow_up_outlined),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 80.h,
                                              width: double.infinity,
                                              color: btnColor,
                                              child: Text(
                                                "$cm cm",
                                                style: const TextStyle(
                                                    fontSize: 14.0),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 30.h,
                                            // ),
                                            InkWell(
                                              onTap: () {
                                                increaseCm();
                                              },
                                              child: const Icon(
                                                  size: 40,
                                                  Icons
                                                      .keyboard_arrow_down_outlined),
                                            ),
                                          ],
                                        ),
                                      ),
                                   



                                   
                                    ],
                                  ),
                                  const Spacer(),
                                  // Weight Column
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Weight",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                          height:
                                              8.0), // Space between label and value
                                      Container(
                                        //height: 170.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              32.r,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 4,
                                                  spreadRadius: 0,
                                                  color:
                                                      bColor.withOpacity(0.4))
                                            ],
                                            color: wColor),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                decreaseWeight();
                                              },
                                              child: const Icon(
                                                  size: 40,
                                                  Icons
                                                      .keyboard_arrow_up_outlined),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 80.h,
                                              width: double.infinity,
                                              color: btnColor,
                                              child: Text(
                                                "$weight kg",
                                                style: const TextStyle(
                                                    fontSize: 14.0),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 30.h,
                                            // ),
                                            InkWell(
                                              onTap: () {
                                                increaseWeight();
                                              },
                                              child: const Icon(
                                                  size: 40,
                                                  Icons
                                                      .keyboard_arrow_down_outlined),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //  const Spacer(),
            Positioned(
              bottom: 0.h,
              left: 0,
              right: 0,
              child: NextButtonWidget(
                title: "Next",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpDateOfBirthSelectionScreen(
                        // cm: cm,
                        // weight: weight,
                        // height: height,
                        // inches: inches,
                        // kg: kg,
                        data: {
                          ...widget.data,
                          'cm': cm,
                          'kg': kg,
                          'height': height,
                          'weight': weight,
                          'inches': inches,
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NeumorphicSwitch extends StatefulWidget {
  @override
  _NeumorphicSwitchState createState() => _NeumorphicSwitchState();
}

class _NeumorphicSwitchState extends State<NeumorphicSwitch> {
  bool isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _toggleSwitch(!isSwitched),
      child: Container(
        width: 60, // Width of the switch
        height: 30, // Height of the switch
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Color(0xFFE0E0E0), // Neumorphic base color
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            // Light shadow for depth effect
            BoxShadow(
              color: Colors.white,
              offset: Offset(-3, -3),
              blurRadius: 5,
            ),
            // Dark shadow for depth effect
            BoxShadow(
              color: Colors.black26,
              offset: Offset(3, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Track shadow (concave effect)
            Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade300,
                      Colors.grey.shade200,
                    ],
                  ),
                ),
              ),
            ),
            // Moving button
            AnimatedAlign(
              duration: Duration(milliseconds: 300),
              alignment:
                  isSwitched ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200, // Inner button color
                  boxShadow: [
                    // Inner shadow for neumorphic effect
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-2, -2),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward, // Icon inside the switch
                    size: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
