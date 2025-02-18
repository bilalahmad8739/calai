import 'package:cal_ai/controllers/providers/auth_provider.dart';
import 'package:cal_ai/utils/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';




class FoodInfoProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late AuthenticationProvider? authProvider;
  DateTime? _selected;

  set selectedDate(DateTime? time) {
    if (time != null) {
      _selected = time;
      print("selected date food--------------->$_selected");
      notifyListeners();
    }
  }

  DateTime? get selectedDate => _selected;

  //post the data of detec food data
Future<void> postDetectFoodData(
    Map<String, dynamic> data, BuildContext context, DateTime selectedDate) async {
  try {
    String uid = await CalSharedPreferences.getString('uid');
    if (uid.isEmpty) return;

    // 1. Format selected date for Firestore
    final normalizedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
    String dateStr = DateFormat('yyyy-MM-dd').format(normalizedDate);
    
    print('Saving food data for date: $dateStr');

    // 2. Process the data to ensure proper number formats
    Map<String, dynamic> processedData = {
      'calories': data['calories'] is String 
          ? double.parse(data['calories']) 
          : (data['calories'] as num).toDouble(),
      'proteins': data['proteins'] is String 
          ? double.parse(data['proteins']) 
          : (data['proteins'] as num).toDouble(),
      'carbs': data['carbs'] is String 
          ? double.parse(data['carbs']) 
          : (data['carbs'] as num).toDouble(),
      'fats': data['fats'] is String 
          ? double.parse(data['fats']) 
          : (data['fats'] as num).toDouble(),
      'title': data['title'] ?? 'Untitled',
      'time': DateFormat('HH:mm:ss').format(DateTime.now()),
      'dateLogged': normalizedDate.toIso8601String(),
    };

    // 3. Create unique ID for this food entry
    String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
    
    // 4. Save to Firebase
    await _firestore
        .collection('userdata')
        .doc(uid)
        .collection("userlogs")
        .doc(dateStr)
        .collection("history")
        .doc(uniqueId)
        .set(processedData);

    print("Food data saved successfully");

    // 5. Reload the data for current date
    final authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    print("normalizedDate----------${normalizedDate}");
    await authProvider.loadConsumedNutrientsForDate(normalizedDate);

  } catch (e) {
    print("Error saving food data: $e");
    rethrow;
  }
}

// Fetch recently logged food data
  Stream<List<Map<String, dynamic>>> getRecentlyLoggedFoodData(DateTime date) {
    try {
      String uid = CalSharedPreferences.getString('uid');
      if (uid.isEmpty) {
        throw Exception('No user logged in');
      }

      DateTime normalizedDate = DateTime(date.year, date.month, date.day);
      String selectedDate = DateFormat('yyyy-MM-dd').format(normalizedDate);

      return _firestore
          .collection('userdata')
          .doc(uid)
          .collection("userlogs")
          .doc(selectedDate)
          .collection("history")
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data();
          // print("date is ------------->${data}");
          // Ensure numeric values are properly converted
          return {
            'calories': (data['calories'] as num).toDouble(),
            'proteins': (data['proteins'] as num).toDouble(),
            'carbs': (data['carbs'] as num).toDouble(),
            'fats': (data['fats'] as num).toDouble(),
            'description': data['description'] ?? '',
            'imagePath': data['imagePath'] ?? '',
            'title': data['title'] ?? 'Untitled',
            'time': data['time'] ?? '',
            'dateLogged': data['dateLogged'] ?? '',
          };
        }).toList();
      });
    } catch (e) {
      print("Error in getRecentlyLoggedFoodData: $e");
      rethrow;
    }
  }
}
