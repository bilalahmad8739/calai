import 'package:cal_ai/controllers/providers/general_provider.dart';
import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/homescreens/Graph_presentation_screen.dart';
import 'package:cal_ai/view/screens/homescreens/daily_tracking_screen.dart';
import 'package:cal_ai/view/screens/settings_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of screens corresponding to each tab
  final List<Widget> _screens = [
    DailyTrackingScreen(),
    InsightScreen(),
    SettingScreen(),
    AddDataScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(
      builder: (context, generalProvider, child) => Scaffold(
        backgroundColor: bgColor,
        body: _screens[generalProvider.selectedIndex],
        bottomNavigationBar: Container(
          
          
          decoration: BoxDecoration(
            color: bgColor, // Background color of the BottomNavigationBar
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                blurRadius: 4, // Softness of the shadow
                spreadRadius: 0, // How much the shadow spreads
                offset: Offset(0, -1), // Moves shadow upward
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: bgColor,
            currentIndex: generalProvider.selectedIndex,
            unselectedFontSize: 12.sp,
            selectedLabelStyle: bodyTextStyle.copyWith(fontSize: 12.sp),
            unselectedLabelStyle:
                bodyTextStyle.copyWith(fontSize: 12.sp, color: bottomBarColor),
            selectedItemColor: Colors.black, // Color for selected items
            unselectedItemColor: bottomBarColor,

            onTap: (index) {
              generalProvider.onItemTapped(index, context);
            },

            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                    color: generalProvider.selectedIndex == 0
                        ? Colors.black
                        : bColor.withOpacity(0.25),
                    height: 35.h,
                    width: 35.w,
                    fit: BoxFit.contain,
                    "assets/home_screen/images/home_screen_img.png"),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                    color: generalProvider.selectedIndex == 1
                        ? bColor
                        :bColor.withOpacity(0.25),
                    height: 30.h,
                    width: 30.w,
                    fit: BoxFit.contain,
                    "assets/home_screen/images/graph_img.png"),
                label: 'Graph',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                    color: generalProvider.selectedIndex == 2
                        ? bColor
                        : bColor.withOpacity(0.25),
                    height: 30.h,
                    width: 30.w,
                    fit: BoxFit.contain,
                    "assets/home_screen/images/setting_img.png"),
                label: 'Setting',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                    color: generalProvider.selectedIndex == 3
                        ? bColor
                        : bColor.withOpacity(0.25),
                    height: 30.h,
                    width: 30.w,
                    fit: BoxFit.contain,
                    "assets/home_screen/images/add_img.png"),
                label: 'Add',
              ),
            ],
            showSelectedLabels: true, // Disable label for selected items
            showUnselectedLabels: true, // Enable label for unselected items
            type: BottomNavigationBarType.fixed, // Ensures all items are shown
          ),
        ),
      ),
    );
  }
}

class AddDataScreen extends StatelessWidget {
  const AddDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(""),
          )
        ],
      ),
    );
  }
}
