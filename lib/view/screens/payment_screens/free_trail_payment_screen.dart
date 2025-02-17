import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/payment_screens/monthly_payment_screen.dart';
import 'package:cal_ai/view/screens/payment_screens/payme;nt_components/bottom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreeTrailPaymentScreen extends StatefulWidget {
  const FreeTrailPaymentScreen({super.key});

  @override
  _FreeTrailPaymentScreenState createState() => _FreeTrailPaymentScreenState();
}

class _FreeTrailPaymentScreenState extends State<FreeTrailPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin:   EdgeInsets.only(left: 20.w,top: 15.h),
                height: 35.h,
                width: 35.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: btnColor),
                child: Image.asset(
                    height: 25.h,
                    width: 25.w,
                    fit: BoxFit.contain,
                    "assets/authentication/images/arrow_back_img.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 30.h,
              ),
              child: Text(
                "We’ll notify you before your free trial expires",
                style: titleTextStyles.copyWith(color: primaryColor),
              ),
            ),
            SizedBox(height: 50.h,),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                height: 235.h,
                width: 188.h,
                fit: BoxFit.contain,
                "assets/authentication/images/notification_img.png"),
            ),
            const Spacer(),
            BottomButtonWidget(
              title: "No Payment Needed at the Moment",
              buttonText: "Start for Free",
              paymentText: "Only Rs 6,900 annually (Rs 575/month)",
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MonthlyPaymentScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
