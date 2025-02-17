import 'package:cal_ai/utils/dialog_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GeneralProvider extends ChangeNotifier {
  XFile? _image;

  int _selectedIndex = 0;

  //setter
  set selectedIndex(int index) {
    _selectedIndex = index;

    print("index change-------->$_selectedIndex");

    notifyListeners();
  }

  //getter

  int get selectedIndex => _selectedIndex;

  XFile? get image => _image;

  final ImagePicker _picker = ImagePicker();

  // Function image to take image from gallary also from camera
  Future<void> getImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        _image = pickedFile;
        notifyListeners();
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error in getImage: $e');
    }
  }

//function for index change
  onItemTapped(int index, context) {
    if (index == 3) {
      UtilDialogs.showCustomDialog(context);
    } else {
      _selectedIndex = index;
      notifyListeners();
      print("selectindex----------$_selectedIndex");

    }
  }
}
