import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/authentication/signup_objective_selection_screen.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpDateOfBirthSelectionScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  SignUpDateOfBirthSelectionScreen({required this.data, super.key});

  @override
  State<SignUpDateOfBirthSelectionScreen> createState() =>
      _SignUpDateOfBirthSelectionScreenState();
}

class _SignUpDateOfBirthSelectionScreenState
    extends State<SignUpDateOfBirthSelectionScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    print("birthday selection screen----------------> ${widget.data}");
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "What is your birth date?",
                      style: titleTextStyless,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "This activity level helps you to tailor your fitness insights!",
                      style: bodyTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),

                  //update design of time picker
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: CustomDatePicker(
                      onDateChanged: (DateTime newDate) {
                        setState(() {
                          selectedDate = newDate;
                          debugPrint("date----------->$selectedDate");
                        });
                      },
                      initialDate: selectedDate,
                    ),
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
                    builder: (context) => SignUpObjectiveSelectionScreen(
                      data: {
                        ...widget.data,
                        'DateSelection': selectedDate,
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  final DateTime? initialDate;

  const CustomDatePicker({
    Key? key,
    required this.onDateChanged,
    this.initialDate,
  }) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime selectedDate;
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
  }

  void _updateDate({int? month, int? day, int? year}) {
    setState(() {
      int newYear = year ?? selectedDate.year;
      int newMonth = month ?? selectedDate.month;
      int newDay = day ?? selectedDate.day;

      // Handle month overflow
      if (newMonth > 12) {
        newYear++;
        newMonth = 1;
      } else if (newMonth < 1) {
        newYear--;
        newMonth = 12;
      }

      // Handle day overflow
      final daysInMonth = DateTime(newYear, newMonth + 1, 0).day;
      if (newDay > daysInMonth) {
        newDay = 1;
        newMonth++;
      } else if (newDay < 1) {
        newMonth--;
        if (newMonth < 1) {
          newYear--;
          newMonth = 12;
        }
        newDay = DateTime(newYear, newMonth + 1, 0).day;
      }

      selectedDate = DateTime(newYear, newMonth, newDay);
      widget.onDateChanged(selectedDate);
    });
  }

  Widget _buildSelector({
    required String value,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
    required double width,
    required ValueChanged<DragUpdateDetails> onScroll,
  }) {
    return GestureDetector(
      onVerticalDragUpdate: onScroll,
      child: Container(
        height: 170.h,
        width: width.w,
        decoration: BoxDecoration(
          color: wColor,
          borderRadius: BorderRadius.circular(32.r),
          boxShadow: [
            BoxShadow(
                color: bColor.withOpacity(0.4),
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 0)
          ],
        ),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                onIncrement();
              },
              child: Icon(Icons.keyboard_arrow_up, size: 40.sp)),
            // IconButton(
            //   icon: Icon(Icons.keyboard_arrow_up, size: 40.sp),
            //   onPressed: onIncrement,
            //  // padding: EdgeInsets.all(8.w),
            // ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                 height: 70.h,
                width: double.infinity,

                decoration: BoxDecoration(color: containerColor, boxShadow: [
                                              BoxShadow(
                                                  offset:
                                                      const Offset(0, 0),
                                                  blurRadius: 0,
                                                  spreadRadius: 0,
                                                  color: bColor
                                                      .withOpacity(0.4))
                                            ],),
                child: Text(value,
                    style: buttontitleTextStyles.copyWith(color: bColor)),
              ),
            ),
             InkWell(
              onTap: () {
                onDecrement();
              },
              child: Icon(Icons.keyboard_arrow_down, size: 40.sp)),
            // IconButton(
            //   icon: Icon(Icons.keyboard_arrow_down, size: 40.sp),
            //   onPressed: onDecrement,
            // //  padding: EdgeInsets.all(8.w),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //months
        Flexible(
          child: _buildSelector(
            value: months[selectedDate.month - 1],
            width: 120,
            onIncrement: () {
              _updateDate(month: selectedDate.month + 1);
            },
            onDecrement: () {
              _updateDate(month: selectedDate.month - 1);
            },
            onScroll: (details) {
              if (details.primaryDelta! < 0) {
                _updateDate(month: selectedDate.month + 1);
              } else if (details.primaryDelta! > 0) {
                _updateDate(month: selectedDate.month - 1);
              }
            },
          ),
        ),
        SizedBox(width: 15.w),
        //date
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: _buildSelector(
              value: selectedDate.day.toString(),
              width: 80,
              onIncrement: () {
                _updateDate(day: selectedDate.day + 1);
              },
              onDecrement: () {
                _updateDate(day: selectedDate.day - 1);
              },
              onScroll: (details) {
                if (details.primaryDelta! < 0) {
                  _updateDate(day: selectedDate.day + 1);
                } else if (details.primaryDelta! > 0) {
                  _updateDate(day: selectedDate.day - 1);
                }
              },
            ),
          ),
        ),
        SizedBox(width: 15.w),
        //year
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: _buildSelector(
              value: selectedDate.year.toString(),
              width: 100,
              onIncrement: () {
                _updateDate(year: selectedDate.year + 1);
              },
              onDecrement: () {
                _updateDate(year: selectedDate.year - 1);
              },
              onScroll: (details) {
                if (details.primaryDelta! < 0) {
                  _updateDate(year: selectedDate.year + 1);
                } else if (details.primaryDelta! > 0) {
                  _updateDate(year: selectedDate.year - 1);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
