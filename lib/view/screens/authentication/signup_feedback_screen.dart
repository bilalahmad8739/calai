import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_notification_permission_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFeedBackScreen extends StatefulWidget {
  late Map<String, dynamic> data;
  SignUpFeedBackScreen({
    required this.data,
  });
  @override
  _SignUpFeedBackScreenState createState() => _SignUpFeedBackScreenState();
}

class _SignUpFeedBackScreenState extends State<SignUpFeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 20.h, bottom: 50.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderRow(
                        image: "assets/authentication/images/line11_img.png"),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        "Share your feedback with us!",
                        textAlign: TextAlign.center,
                        style: titleTextStyless,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: RatingBar.builder(
                        initialRating: 5, // Set initial rating (0 to 5)
                        minRating: 1, // Minimum rating
                        direction: Axis.horizontal,
                        allowHalfRating: true, // Allows half-star ratings
                        itemCount: 5, // Number of stars
                        itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star, // Use star outline for the icon
                          color: bColor,
                        ),
                        onRatingUpdate: (rating) {
                          print('Rating: $rating'); // Handle rating updates
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "MacroPal AI is tailored specifically for you",
                      style: buttonTextStyle.copyWith(color: primaryColor),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image.asset(
                              fit: BoxFit.contain,
                              height: 95.h,
                              width: 200.w,
                              "assets/authentication/images/persons_img.png"),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "+1000 MacroPal AI people",
                            style: bodyTextStyle,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ListView.builder(
                      //scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) => Container(
                        padding:
                            EdgeInsets.only(left: 7.w, right: 4.w, top: 10.h,bottom: 5.h),
                        margin: EdgeInsets.only(bottom: 15.h),
                        // height: 110.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: bColor.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                    height: 30.h,
                                    width: 30.w,
                                    fit: BoxFit.contain,
                                    "assets/authentication/images/rating_person_img.png"),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "Huzaifa Shah",
                                  style: buttonSubtitleTextStyles.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: bColor),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),

                                // RatingBar.builder(
                                //   initialRating:
                                //       5, // Set initial rating (0 to 5)
                                //   minRating: 1, // Minimum rating
                                //   direction: Axis.horizontal,
                                //   allowHalfRating:
                                //       true, // Allows half-star ratings
                                //   itemCount: 5, // Number of stars
                                //   //  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                //   itemBuilder: (context, _) => Icon(
                                //     Icons.star, // Use star outline for the icon
                                //     color: bColor,
                                //     size: 3,
                                //   ),
                                //   onRatingUpdate: (rating) {
                                //     print(
                                //         'Rating: $rating'); // Handle rating updates
                                //   },
                                // ),

                                Image.asset(
                                    width: 82.w,
                                    fit: BoxFit.contain,
                                    "assets/authentication/images/Group.png"),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              " MacroPal AI is a game-changer for tracking calories and achieving fitness goals. Its intuitive design and data-driven insights make weight management effortless!",
                              style: buttonSubtitleTextStyles3.copyWith(
                                  color: bColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
            //  SizedBox(
            //         height: 50.h,
            //       ),
            Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 0.w,
              child: NextButtonWidget(
                title: "Next",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUpNotificationPermissionScreen(
                                data: {
                                  ...widget.data,
                                },
                              )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
