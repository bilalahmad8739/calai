import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_feedback_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpMonthlyProgressScreen extends StatefulWidget {
  late Map<String, dynamic> data;

  SignUpMonthlyProgressScreen({
    required this.data,
  });
  @override
  _SignUpMonthlyProgressScreenState createState() =>
      _SignUpMonthlyProgressScreenState();
}

class _SignUpMonthlyProgressScreenState
    extends State<SignUpMonthlyProgressScreen> {
  // Sample data for the spline chart
  final List<ChartData> chartData = [
    ChartData(day: 'Mon', calories: 300),
    ChartData(day: 'Tues', calories: 400),
    ChartData(day: 'Wed', calories: 350),
    ChartData(day: 'Thurs', calories: 450),
    ChartData(day: 'Fri', calories: 505),
    ChartData(day: 'Sat', calories: 420),
    ChartData(day: 'Sun', calories: 300),
  ];

  @override
  Widget build(BuildContext context) {
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
                      image: "assets/authentication/images/line10_img.png"),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Your potential is immense to reach your goal",
                      style: titleTextStyless,
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),

                  SizedBox(height: 220, child: LineChartSample()),
                  // Container(
                  //   height: 215.h,
                  //   child: SfCartesianChart(

                  //     backgroundColor: bgColor,
                  //      plotAreaBorderWidth: 0,
                  //     primaryXAxis: CategoryAxis(
                  //       majorGridLines: MajorGridLines(width: 0),
                  //       labelStyle: TextStyle(
                  //         fontSize: 12.sp,
                  //         color: Colors.grey[600],
                  //       ),
                  //     ),
                  //     primaryYAxis: NumericAxis(isVisible: false),
                  //     tooltipBehavior:
                  //         TooltipBehavior(enable: true, format: 'point.y cal'),
                  //     series: <SplineSeries<ChartData, String>>[
                  //       SplineSeries<ChartData, String>(
                  //         dataSource: chartData,
                  //         xValueMapper: (ChartData data, _) => data.day,
                  //         yValueMapper: (ChartData data, _) => data.calories,
                  //         color: Colors.grey,
                  //         width: 2.w,
                  //         markerSettings: MarkerSettings(
                  //           isVisible: true,
                  //           height: 10.h,
                  //           width: 10.w,
                  //           color: Colors.black,
                  //         ),

                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // Image.asset(
                  //     height: 220.h,
                  //     width: 220.w,
                  //     fit: BoxFit.contain,
                  //     "assets/authentication/images/barchart.png"),
                  // Container(
                  //   child: SfCartesianChart(
                  //     backgroundColor: containerColor,
                  //   ),
                  // ),

                  SizedBox(
                    height: 5.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "3 Days",
                  //       style:
                  //           bodyTextStyle.copyWith(fontWeight: FontWeight.w500),
                  //     ),
                  //     SizedBox(
                  //       width: 10.w,
                  //     ),
                  //     Image.asset(
                  //         width: 80.w,
                  //         fit: BoxFit.contain,
                  //         "assets/authentication/images/Arrow_forword.png"),
                  //     SizedBox(
                  //       width: 10.w,
                  //     ),
                  //     Text(
                  //       "3 Days",
                  //       style:
                  //           bodyTextStyle.copyWith(fontWeight: FontWeight.w500),
                  //     ),
                  //   ],
                  // ),

                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    " MacroPal AI's data shows weight loss often starts slowly, but after 7 days, fat-burning accelerates significantly!",
                    style: bodyTextStyle,
                  )
                ],
              ),
            ),
            const Spacer(),
            NextButtonWidget(
              title: "Next",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpFeedBackScreen(
                              data: {
                                ...widget.data,
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

class LineChartSample extends StatefulWidget {
  @override
  _LineChartSampleState createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  int peakIndex = 0;
  double peakValue = 0;
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<FlSpot> spots = [
    FlSpot(0, 310),
    FlSpot(1, 220),
    FlSpot(2, 250),
    FlSpot(3, 300),
    FlSpot(4, 504), // Peak on Friday
    FlSpot(5, 390),
    FlSpot(6, 390),
  ];

  @override
  void initState() {
    super.initState();
    _determinePeak();
  }

  void _determinePeak() {
    for (int i = 0; i < spots.length; i++) {
      if (spots[i].y > peakValue) {
        peakValue = spots[i].y;
        peakIndex = i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: LineChart(
             LineChartData(
  gridData: FlGridData(show: false),
  borderData: FlBorderData(show: false),
  titlesData: FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  ),
  lineBarsData: [
    LineChartBarData(
      spots: spots,
      isCurved: true,
      color: Colors.grey,
      barWidth: 1,
      isStrokeCapRound: false,
      belowBarData: BarAreaData(
        show: true,
        color: Colors.grey.withOpacity(0.3),
        gradient: LinearGradient(
          colors: [
            containerColor.withOpacity(0.3),
            containerColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          if (index == peakIndex) {
            return FlDotCirclePainter(
              radius: 3,
              color: bColor,
              strokeWidth: 3,
              strokeColor: bColor,
            );
          } else {
            return FlDotCirclePainter(
              radius: 0,
            );
          }
        },
      ),
      showingIndicators: [peakIndex],
    ),
  ],
  lineTouchData: LineTouchData( // Add tooltip customization
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: containerColor, //  Change tooltip background color
      tooltipRoundedRadius: 8, //  Optional: Adjust tooltip border radius
      tooltipPadding: EdgeInsets.all(12), //  Optional: Add padding
      getTooltipItems: (touchedSpots) {
        return touchedSpots.map((touchedSpot) {
          return LineTooltipItem(
            '${touchedSpot.y} cal', //  Customize tooltip text
            TextStyle(
              color: bColor, //  Change tooltip text color
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          );
        }).toList();
      },
    ),
  ),
),

            ),
          ),
          // Positioned widget to show peak value label on the top
          // Positioned(
          //   top: 0,
          //   bottom:200, // Adjust the position to move further up
          //   left: 18.0 +
          //       (peakIndex * 40) -
          //       10, // Adjust the position based on the peak index
          //   child: Container(
          //     padding: EdgeInsets.all(10.r),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.r),
          //         color: Colors.blue,
          //         //containerColor,
          //         boxShadow: [
          //           BoxShadow(
          //               color: containerColor.withOpacity(0.25),
          //               blurRadius: 10,
          //               offset: Offset(0, 2),
          //               spreadRadius: 0)
          //         ]),
          //     child: Text(
          //       '${peakValue} cal',
          //       style: TextStyle(
          //           color: bColor, fontSize: 14, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
        
        
          // Positioned widget to show peak day label below the graph
          Positioned(
            bottom: 0, // Adjust the position as needed to move below the graph
            left: 18.0 +
                (peakIndex * 40) -
                10, // Adjust the position based on the peak index
            child: Text(
              days[peakIndex],
              style: TextStyle(
                  color: bColor, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// Data model for the chart
class ChartData {
  final String day;
  final int calories;

  ChartData({required this.day, required this.calories});
}
