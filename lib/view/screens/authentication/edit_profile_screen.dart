import 'package:cal_ai/utils/app_colors.dart';
import 'package:cal_ai/utils/app_styles.dart';
import 'package:cal_ai/view/components/custom_header.dart';
import 'package:cal_ai/view/components/next_button_widget.dart';
import 'package:cal_ai/view/screens/help_center_screen/help_center_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      // Perform submission action here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile Updated Successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: 
      SafeArea(
        child: Column(
          children: [
            Expanded(
              // Ensures content fills the available space
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            // Back Button
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    height: 35.h,
                                    width: 35.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: btnColor),
                                    child: Image.asset(
                                      height: 25.h,
                                      width: 25.w,
                                      fit: BoxFit.contain,
                                      "assets/authentication/images/arrow_back_img.png",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:  EdgeInsets.only(right: 15.w),
                                    child: Text(
                                        textAlign: TextAlign.center,
                                        "Edit Profile",
                                        style: headerTextStyles),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50.h),

                            // Profile Image
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 36.r,
                                backgroundImage: AssetImage(
                                    "assets/authentication/images/rating_person_img.png"),
                              ),
                            ),
                            SizedBox(height: 7.h),

                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Edit photo",
                                style: buttonSubtitleTextStyles.copyWith(
                                    color: bColor),
                              ),
                            ),

                            SizedBox(height: 40.h),

                            TextfieldTitle("Full Name"),
                            SizedBox(height: 5.h),

                            // Input Fields
                            CustomTextField(
                              controller: _fullNameController,
                              label: "",
                              validator: (value) => value!.isEmpty
                                  ? "Full Name is required"
                                  : null,
                            ),
                            SizedBox(height: 17.h),

                            TextfieldTitle("Email Address"),
                            SizedBox(height: 5.h),

                            CustomTextField(
                              controller: _emailController,
                              label: "",
                              validator: (value) {
                                if (value!.isEmpty) return "Email is required";
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value))
                                  return "Enter a valid email";
                                return null;
                              },
                            ),
                            SizedBox(height: 17.h),

                            TextfieldTitle("Phone"),
                            SizedBox(height: 5.h),

                            CustomTextField(
                              controller: _phoneController,
                              label: "",
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "Phone number is required";
                                if (!RegExp(r'^\+?[0-9]{10,13}$')
                                    .hasMatch(value))
                                  return "Enter a valid phone number";
                                return null;
                              },
                            ),
                            SizedBox(height: 17.h),

                            TextfieldTitle("DOB"),
                            SizedBox(height: 5.h),

                            CustomTextField(
                              controller: _dobController,
                              label: "",
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (pickedDate != null) {
                                  _dobController.text =
                                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                }
                              },
                              validator: (value) =>
                                  value!.isEmpty ? "DOB is required" : null,
                            ),
                            SizedBox(height: 40.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Positioned Bottom Button (Now correctly placed)
            NextButtonWidget(
              title: "Continue",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCentreScreen()),
                );
              },
            ),
          ],
        ),
      ),


);
  }

  Widget TextfieldTitle(String text) {
    return Text(
      text,
      style:
          bodyTextStyle.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool readOnly;
  final Function()? onTap;
  final String? Function(String?)? validator;

  CustomTextField({
    required this.controller,
    required this.label,
    this.readOnly = false,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: containerColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      ),
    );
  }
}
