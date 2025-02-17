import 'package:cal_ai/controllers/providers/auth_provider.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/screens/authentication/component/socialbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  late Map<String, dynamic> data;

  LoginScreen({required this.data, Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    print("all data ---------------->${widget.data.toString()}");

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                // Logo and flame icon
                Image.asset(
                    height: 100.h,
                    width: 210.w,
                    fit: BoxFit.cover,
                    "assets/home_screen/images/main_img.png"),
                SizedBox(height: 24.h),
                // Welcome Text
                Text("Let's Get Started!", style: titleTextStyless),
                SizedBox(height: 8.h),
                Text(
                  "Start exploring your account",
                  style: bodyTextStyle,
                ),
                SizedBox(height: 100.h),
                // Social Login Buttons
                Consumer<AuthenticationProvider>(
                  builder: (context, authProvider, child) => SocialLoginButton(
                    text: 'Continue with Google',
                    onPressed: () async {
                      print(
                          "Data being passed to signInWithGoogle: ${widget.data}");

                      authProvider.signInWithGoogle(context, widget.data);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                      print(
                          "Data after passed to signInWithGoogle: ${widget.data}");
                    },
                    icon: 'assets/authentication/images/google_img.png',
                  ),
                ),
                SizedBox(height: 16.h),
                SocialLoginButton(
                  text: 'Continue with Apple',
                  onPressed: () {},
                  icon: 'assets/authentication/images/apple_img.png',
                ),

                SizedBox(height: 16.h),
                // Login Button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Custom Social Login Button Widget

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          padding: padding,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
