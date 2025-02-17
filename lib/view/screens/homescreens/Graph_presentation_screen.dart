import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                height: 32.h,
                width: 34.w,
                fit: BoxFit.contain,
                logoImage,
              ),
              Spacer(),
              Text('Insight', style: headerTextStyles),
              Spacer(),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 30.h,),
            /// TabBar inside a rounded container (like in AppBar example)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 5.h),
              child: Container(
                height:35.h,
                // padding: EdgeInsets.all(5), // Inner spacing
                decoration: BoxDecoration(
                  color:
                      Colors.grey[200], // Background color of TabBar container
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: ShapeDecoration(
                    color: Colors.black, // Selected tab background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.r), // Rounded corners
                    ),
                  ),
                  tabs: [
                    Tab(text: 'Weekly'),
                    Tab(text: 'Monthly'),
                    Tab(text: 'Yearly'),
                  ],
                ),
              ),
            ),

            /// Expanded TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  _buildInsightContent(),
                  _buildInsightContent(),
                  _buildInsightContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildInsightContent() {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          _buildGraphCard('Calorie (kcal)', _buildBarChart(), Colors.black),
          _buildGraphCard(
              'Nutrition (%)', _buildStackedBarChart(), Colors.orange),
          _buildGraphCard('Water (ml)', _buildBarChart(), Colors.blue),
          _buildGraphCard('Weight (kg)', _buildBarChart(), Colors.orangeAccent),
        ],
      ),
    ),
  );
}

Widget _buildGraphCard(String title, Widget chart, Color color) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.h),
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(10.r),
      // boxShadow: [
      //   BoxShadow(color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 2),
      // ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Container(height: 120.h, child: chart),
      ],
    ),
  );
}
Widget _buildBarChart() {
  return BarChart(
    BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: primaryColor, // Tooltip background color set to blue
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '${rod.toY.toInt()} kcal',
              TextStyle(color: Colors.white, fontSize: 14.sp),
            );
          },
        ),
      ),
      barGroups: List.generate(
        7,
        (index) => BarChartGroupData(
          x: index + 4,
          barRods: [
            BarChartRodData(
              fromY: 0,
              toY: (2000 + index * 200).toDouble(),
              width: 20,
              color: index == 1 ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.zero,
            ),
          ],
        ),
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 500,
            reservedSize: 40,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: TextStyle(fontSize: 14, color: Colors.black),
              );
            },
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(
        drawVerticalLine: true,
        horizontalInterval: 500,
        getDrawingHorizontalLine: (value) {
          if (value == 2500) {
            return FlLine(
              color: Colors.black,
              strokeWidth: 2,
              dashArray: [5, 5],
            );
          }
          return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
        },
      ),
      minY: 0,
      maxY: 3000,
    ),
  );
}


// Widget _buildBarChart() {
//   return BarChart(

//     BarChartData(
//       barTouchData: BarTouchData(touchTooltipData: ),
//       barGroups: List.generate(
//         7,
//         (index) => BarChartGroupData(
//           x: index + 4, // X-axis values start from 4
//           barRods: [
//             BarChartRodData(
//               fromY: 0,
//               toY: (2000 + index * 200).toDouble(), // Sample calorie data
//               width: 20,
//               color: index == 1 ? Colors.black : Colors.grey, // Highlighted bar
//               borderRadius: BorderRadius.zero,
//             ),
//           ],
//         ),
//       ),
//       titlesData: FlTitlesData(
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             interval: 500, // Y-axis labels at 500, 1000, 1500...
//             reservedSize: 40,
//           ),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: (value, meta) {
//               return Text(
//                 value.toInt().toString(),
//                 style: TextStyle(fontSize: 14, color: Colors.black),
//               );
//             },
//           ),
//         ),
//         topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//       ),
//       borderData: FlBorderData(show: false),
//       gridData: FlGridData(
//         drawVerticalLine: true,
//         horizontalInterval: 500, // Dashed horizontal lines at every 500
//         getDrawingHorizontalLine: (value) {
//           if (value == 2500) {
//             // Dashed calorie limit line
//             return FlLine(
//               color: Colors.black,
//               strokeWidth: 2,
//               dashArray: [5, 5], // Dashed line effect
//             );
//           }
//           return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
//         },
//       ),
//       minY: 0,
//       maxY: 3000,
//     ),
//   );
// }




Widget _buildStackedBarChart() {
  return BarChart(
    BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: primaryColor, // Tooltip background color set to blue
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '${rod.toY.toInt()}%',
              TextStyle(color: Colors.white, fontSize: 14.sp),
            );
          },
        ),
      ),
      barGroups: List.generate(
        7,
        (index) => BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(toY: 50, color: Colors.orange),
            BarChartRodData(toY: 30, color: Colors.blue),
            BarChartRodData(toY: 20, color: Colors.red),
          ],
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(show: false),
    ),
  );
}
