import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCentreScreen extends StatefulWidget {
  @override
  _HelpCentreScreenState createState() => _HelpCentreScreenState();
}

class _HelpCentreScreenState extends State<HelpCentreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            //header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
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
                  const Spacer(),

                  // Title
                  Text(
                    "Help Centre",
                    style: headerTextStyles,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ////////////////////////////////////////////////////        Custom Tab Bar            ///////////////////////////////////////////////////

            CustomTabBar(tabController: _tabController),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // FAQs Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
                    child: FAQSection(),
                  ),
                  const ContactUSScreen(),

                  // Contact Us Section
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUSScreen extends StatelessWidget {
  const ContactUSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25.h),
            const ContactUsCustomContainer(
              imagePath: "assets/settings/images/custom_service_img.png",
              text: "Customer Service",
            ),
            SizedBox(height: 25.h),
            const ContactUsCustomContainer(
              imagePath: "assets/settings/images/whatsapp_img.png",
              text: "Whatsapp",
            ),
            SizedBox(height: 25.h),
            const ContactUsCustomContainer(
              imagePath: "assets/settings/images/website_img.png",
              text: "Website",
            ),
            SizedBox(height: 25.h),
            const ContactUsCustomContainer(
              imagePath: "assets/settings/images/facebook_img.png",
              text: "Facebook",
            ),
            SizedBox(height: 25.h),
            const ContactUsCustomContainer(
              imagePath: "assets/settings/images/instagram_img.png",
              text: "Instagram",
            ),
            SizedBox(height: 25.h),
            const ContactUsCustomContainer(
              imagePath: "assets/settings/images/twitter_img.png",
              text: "Twitter",
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}

class ContactUsCustomContainer extends StatelessWidget {
  final String imagePath;
  final String text;

  const ContactUsCustomContainer({
    required this.text,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w), // Add margin
      height: 55.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: containerColor,
      ),
      child: Row(
        children: [
          if (imagePath.isNotEmpty) // Only show image if path is provided
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  height: 25.h,
                  width: 25.w,
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
            ),
          SizedBox(width: 22.w),
          Text(
            text,
            style: bodyTextStyle,
          ),
        ],
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(color: Colors.black, width: 3), // Full-width underline
        ),
      ),
      indicatorPadding: EdgeInsets.zero,
      labelStyle: headerTextStyles.copyWith(
          fontSize: 16.sp, fontWeight: FontWeight.w600),
      controller: tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.black,
      indicatorWeight: 3,
      tabs: [
        //  Tab(text: "FAQs"),
        Tab(child: Align(alignment: Alignment.center, child: Text("FAQs"))),
        Tab(
            child:
                Align(alignment: Alignment.center, child: Text("Contact Us"))),
        // Tab(text: "Contact Us"),
      ],
    );
  }
}

class FAQSection extends StatelessWidget {
  final List<String> categories = ["General", "Account", "Payment", "Services"];
  final List<Map<String, String>> faqData = List.generate(
    4,
    (index) => {
      "question": "What is MacroPal AI and how does it work?",
      "answer":
          "Learn about the app’s purpose and how it uses AI to track and manage your calorie intake."
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        // Categories Row
        Wrap(
          spacing: 8.w,
          children: categories
              .map((category) => CategoryChip(title: category))
              .toList(),
        ),
        SizedBox(height: 16.h),
    
        // FAQ List
        Expanded(
          child: ListView.builder(
            itemCount: faqData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: FAQCard(
                  question: faqData[index]["question"]!,
                  answer: faqData[index]["answer"]!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String title;

  const CategoryChip({required this.title});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.w),
      labelPadding: EdgeInsets.zero,
      label: Text(title, style: bodyTextStyle),
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r),
        side: const BorderSide(color: Colors.black),
      ),
    );
  }
}

class FAQCard extends StatefulWidget {
  final String question;
  final String answer;

  const FAQCard({required this.question, required this.answer});

  @override
  _FAQCardState createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: containerColor,
      margin: EdgeInsets.symmetric(vertical: 8.h),
    
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: ExpansionTile(
        shape: const Border(),
        title: Text(
          widget.question,
          style: bodyTextStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        trailing: Icon(isExpanded ? Icons.arrow_drop_down : Icons.arrow_right),
        children: [
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(widget.answer,
                style: bodyTextStyle.copyWith(fontSize: 12.sp)),
          ),
        ],
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
      ),
    );
  }
}



// contactusCustomContainer(
                    //   text: "Customer Service",
                    //   imagePath: "",
                    // ),
                    // SizedBox(
                    //   height: 25.h,
                    // ),
                    // contactusCustomContainer(
                    //   text: "Customer Service",
                    //   imagePath: "",
                    // ),
                    // SizedBox(
                    //   height: 25.h,
                    // ),
                    // contactusCustomContainer(
                    //   text: "Customer Service",
                    //   imagePath: "",
                    // ),
                    // SizedBox(
                    //   height: 25.h,
                    // ),
                    // contactusCustomContainer(
                    //   text: "Customer Service",
                    //   imagePath: "",
                    // ),
                    // SizedBox(
                    //   height: 25.h,
                    // ),
                    // contactusCustomContainer(
                    //   text: "Customer Service",
                    //   imagePath: "",
                    // ),
                    // SizedBox(
                    //   height: 25.h,
                    // ),