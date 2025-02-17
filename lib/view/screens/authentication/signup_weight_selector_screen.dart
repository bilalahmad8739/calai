import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/authentication/signup_achievable_goal_screen.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpWeightSelectorScreen extends StatefulWidget {
  final Map<String, dynamic> initalValue;

  const SignUpWeightSelectorScreen({Key? key, required this.initalValue})
      : super(key: key);
  @override
  _SignUpWeightSelectorScreenState createState() =>
      _SignUpWeightSelectorScreenState();
}

class _SignUpWeightSelectorScreenState
    extends State<SignUpWeightSelectorScreen> {
  final ScrollController _scrollController = ScrollController();
  int currentWeight = 60;

  @override
  void initState() {
    super.initState();

    currentWeight =
        int.tryParse(widget.initalValue['selectedValue'].toString()) ?? 60;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Calculate the scroll offset for the initial weight
      double initialOffset =
          currentWeight * 10; // Each weight corresponds to 10 pixels
      _scrollController.jumpTo(initialOffset);
    });

    _scrollController.addListener(() {
      setState(() {
        // Update the current weight based on the scroll offset
        currentWeight = (_scrollController.offset / 10).toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        "weight selection screen --------------->${widget.initalValue.toString()}");
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderRow(
                      image: "assets/authentication/images/line6_img.png"),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "What weight would you like to achieve?",
                      style: titleTextStyless,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Container(
              //height: 290.h,
              width: double.infinity,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44.r),
                  color: containerColor,
                  boxShadow: [
                    BoxShadow(
                      color: bColor.withOpacity(0.25),
                      offset: Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 0,
                    )
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                      padding: EdgeInsets.all(7.w),
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: primaryColor,
                      ),
                      child: Text(
                        '${widget.initalValue['selectedValue']}',
                        style:
                            buttonSubtitleTextStyles3.copyWith(color: wColor),
                      )),
                  SizedBox(height: 10.h),
                  Text(
                    '${currentWeight.toInt()}',
                    style: unitTextStyle.copyWith(
                      fontSize: 60.sp,
                    ),
                  ),

                  //stack of ruler and weight
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120.h,
                        margin: EdgeInsets.only(bottom: 15.h),
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 201, // Ranges from 0kg to 200kg
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CustomPaint(
                                  size: Size(10, 40),
                                  painter:
                                      RulerPainter(isMajor: index % 10 == 0),
                                ),
                                if (index % 10 == 0)
                                  Text(
                                    '$index',
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                      Text(
                        '${currentWeight.toInt()} kg',
                        style: unitTextStyle.copyWith(
                            color: bColor.withOpacity(0.3)),
                      ),
                      Positioned(
                        top: 0.h,
                        child: Container(
                          width: 2,
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            NextButtonWidget(
              title: "Next",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpAchievableGoalsScreen(
                              data: {
                                ...widget.initalValue,
                                'currentWeight': currentWeight,
                              },
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RulerPainter extends CustomPainter {
  final bool isMajor;

  RulerPainter({required this.isMajor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    double lineHeight = isMajor ? 40 : 20;

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, lineHeight),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
