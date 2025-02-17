import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_gender_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/authentication/images/fruit_img.png",
      "title": "Smart Tracking Calorie for a Healthier You",
      "subtitle":
          "Track your calories effortlessly with the right tools and habits."
    },
    {
      "image": "assets/authentication/images/fruit_img.png",
      "title": "Nutrition Insights",
      "subtitle":
          "Track proteins, fats, carbs, and more to maintain balance and achieve your health goals."
    },
    {
      "image": "assets/authentication/images/man_img_.png",
      "title": "Get Started with MacroPal AI!",
      "subtitle":
          "Your journey to better health Calbegins here.Let’s start now!"
    },
  ];

  @override
  void initState() {
    super.initState();
    // Add listener to pageController
    pageController.addListener(() {
      if (pageController.page != null) {
        final newIndex = pageController.page!.round();
        if (newIndex != currentIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpGenderSelectionScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Background image
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Image.asset(
                    onboardingData[currentIndex]["image"] ?? "",
                    key: ValueKey<int>(currentIndex),
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // Overlay images based on currentIndex
                currentIndex == 0
                    ? Positioned(
                      

                        bottom: 420.h,
                        right: 70.w,
                        left: MediaQuery.of(context).size.width / 2 - 120.w,
                        child: Image.asset(
                          "assets/authentication/images/scanner_img.png",
                          height: 260.h,
                          width: 260.w,
                          fit: BoxFit.contain,
                        ),
                      )
                    : const SizedBox.shrink(),

                currentIndex == 1
                    ? Positioned(
                        bottom: 630.h,
                        right: 250.w,
                        left: MediaQuery.of(context).size.width / 2 - 150.w,
                        child: Image.asset(
                          "assets/authentication/images/proteins.png",
                          height: 120.h,
                          width: 100.w,
                          fit: BoxFit.contain,
                        ),
                      )
                    : const SizedBox.shrink(),
                //image 2
                if (currentIndex == 1)
                  Positioned(
                      bottom: 550.h,
                        right: 80.w, // Adjust this value to position the container
                      left: MediaQuery.of(context).size.width / 2 -
                          150.w, // Center the container horizontally
                      child: Image.asset(
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.contain,
                          "assets/authentication/images/fats_img.png")),
                //  image 3
                if (currentIndex == 1)
                  Positioned(
                      bottom: 470.h,
                      right: 20.w, // Adjust this value to position the container
                      left: MediaQuery.of(context).size.width / 2 -
                          50.w, // Center the container horizontally
                      child: Image.asset(
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.contain,
                          "assets/authentication/images/fib_img.png")),

                if (currentIndex == 2)
                  Positioned(
                    bottom: 650.h,
                    right: 180.w,
                    left: MediaQuery.of(context).size.width / 2 - 180.w,
                    child: Container(
                      alignment: Alignment.center,
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bColor.withOpacity(0.5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centers content vertically
                        children: [
                          Text(
                            "Target \n weight",
                            style: containerTextStyle.copyWith(
                              color: containerColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h), // Small spacing between lines
                          Text(
                            "70 Kg",
                            style: containerTextStyle.copyWith(
                              color: containerColor,
                              fontSize:
                                  16.sp, // Slightly bigger font for emphasis
                              fontWeight: FontWeight.bold, // Make it bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Bottom container with content
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 400.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.r),
                          topRight: Radius.circular(32.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView.builder(
                                controller: pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                itemCount: onboardingData.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 30.h),
                                        Text(
                                          onboardingData[index]["title"]!,
                                          textAlign: TextAlign.center,
                                          style: titleTextStyles,
                                        ),
                                        SizedBox(height: 35.h),
                                        Text(
                                          onboardingData[index]["subtitle"]!,
                                          textAlign: TextAlign.center,
                                          style: bodyTextStyle,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Center(
                              child: SmoothPageIndicator(
                                controller: pageController,
                                count: onboardingData.length,
                                effect: const WormEffect(
                                  dotColor: Colors.grey,
                                  activeDotColor: Colors.black,
                                  dotHeight: 12.0,
                                  dotWidth: 12.0,
                                  spacing: 12.0,
                                  paintStyle: PaintingStyle.stroke,
                                  strokeWidth: 2.0,
                                ),
                                onDotClicked: (index) {
                                  pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 15.h),
                            NextButtonWidget(
                              title: "Next",
                              ontap: nextPage,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
