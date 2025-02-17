import 'package:cal_ai/controllers/providers/general_provider.dart';
import 'package:cal_ai/view/components/dialog_custom_button.dart';
import 'package:cal_ai/view/screens/describe_food_screen/add_food_screen.dart';
import 'package:cal_ai/view/screens/food_detection_screen/food_detection_screen.dart';
import 'package:cal_ai/view/screens/save_food_screen/favorite_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UtilDialogs {
  //dialog for showing custom buttons
  static void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.only(bottom: 100.h),

           alignment: Alignment.bottomCenter,
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      imagePath:
                          'assets/home_screen/images/barbell_outline.png', // Replace with your image path
                      label: "Record workout",
                      onTap: () {
                        // Navigator.pop(context);
                        // Perform your action here
                      },
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  CustomButton(
                    imagePath:
                        'assets/food_detection/images/save_img.png', // Replace with your image path
                    label: "Preserve foods",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoriteItemScreen()));
                      // Perform your action here
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    imagePath:
                        'assets/home_screen/images/write_pencil.png', // Replace with your image path
                    label: "Expound food",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddFoodScreen()));

                      // AddFoodScreen
                    },
                  ),
                  SizedBox(
                    width: 14.w,
                  ),

                  // SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(
                      imagePath:
                          'assets/food_detection/images/barcode_img.png', // Replace with your image path
                      label: "Detect food",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodDetectionScreen()));
                        // Perform your action here
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

//dialog for camera and gallery

  static Future<void> show(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  print("Camera  click");

                  Provider.of<GeneralProvider>(context, listen: false)
                      .getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Gallery"),
                onTap: () {
                  //call the gallery picker
                  print("Gallary click");
                  Provider.of<GeneralProvider>(context, listen: false)
                      .getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
