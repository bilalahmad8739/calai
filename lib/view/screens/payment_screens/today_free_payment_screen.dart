import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/payment_screens/free_trail_payment_screen.dart';
import 'package:cal_ai/view/screens/payment_screens/payme;nt_components/bottom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayFreePaymentScreen extends StatefulWidget {
  const TodayFreePaymentScreen({super.key});

  @override
  _TodayFreePaymentScreenState createState() => _TodayFreePaymentScreenState();
}

class _TodayFreePaymentScreenState extends State<TodayFreePaymentScreen> {
  bool _isCentered = false;

  @override
  void initState() {
    super.initState();
    // Trigger animation when the screen is loaded
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isCentered = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 30.h,
                  ),
                  child: Text(
                    "Experience CalAI for free today.",
                    style: titleTextStyles.copyWith(color: primaryColor),
                  ),
                ),
                const Spacer(),
                BottomButtonWidget(
                  title: "No Payment Needed at the Moment",
                  buttonText: "Start for Free",
                  paymentText: "Only Rs 6,900 annually (Rs 575/month)",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FreeTrailPaymentScreen()));
                  },
                ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              top: _isCentered
                  ? MediaQuery.of(context).size.height / 2 -
                      100.h // Center vertically
                  : MediaQuery.of(context).size.height -
                      250.h, // Bottom-right corner
              left: _isCentered
                  ? MediaQuery.of(context).size.width / 2 -
                      150.w // Center horizontally
                  : MediaQuery.of(context).size.width - 320.w, // Right corner
              height: 200.h,
              width: 300.w,
              child: Image.asset(
                "assets/authentication/images/lcd.png",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
