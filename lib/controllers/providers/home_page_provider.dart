import 'dart:async';
import 'package:cal_ai/services/firestore_services.dart';
import 'package:cal_ai/utils/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DailyTrackingScreenProvider extends ChangeNotifier {
  final FirestoreServices _firestoreServices = FirestoreServices();
  Map<String, dynamic>? _userData;
  double? _result; // BMR
  double _totalCalories = 0;
  double _totalProteins = 0;
  double _totalFats = 0;
  DateTime? dateTime;
  double _remainingCalories = 0;
  Map<DateTime, double> _caloriesByDate = {};
  DateTime _selectedDate = DateTime.now();
  Timer? _resetTimer;

  // Getters
  Map<String, dynamic>? get userData => _userData;
  double? get result => _result;
  double get totalCalories => _totalCalories;
  double get totalProteins => _totalProteins;
  double get totalFats => _totalFats;
  double get remainingCalories => _remainingCalories;
  Map<DateTime, double> get dateCalories => _caloriesByDate;
  DateTime get selectedDate => _selectedDate;



   // Setters
  set userData(Map<String, dynamic>? value) {
    _userData = value;
    notifyListeners();
  }

  set result(double? value) {
    _result = value;
    notifyListeners();
  }

  set totalCalories(double value) {
    _totalCalories = value;
    notifyListeners();
  }

  set totalProteins(double value) {
    _totalProteins = value;
    notifyListeners();
  }

  set totalFats(double value) {
    _totalFats = value;
    notifyListeners();
  }

  set remainingCalories(double value) {
    _remainingCalories = value;
    notifyListeners();
  }

  set dateCalories(Map<DateTime, double> value) {
    _caloriesByDate = value;
    notifyListeners();
  }

  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  // Setter for dateTime
  // set dateTime(DateTime? value) {
  //   dateTime = value;
  //   notifyListeners();
  // }

  // Initialize provider
  Future<void> initialize() async {
    await getUserData();
    await onAppLaunch();
  }

  // Save calories for specific date
  Future<void> saveCaloriesForDate(DateTime date, double calories) async {
    String dateKey = _formatDateKey(date);
    await CalSharedPreferences.setdouble('calories_$dateKey', calories);
    _caloriesByDate[date] = calories;
    notifyListeners();
  }

  // Load calories for specific date
  Future<double> loadCaloriesForDate(DateTime date) async {
    String dateKey = _formatDateKey(date);
    return CalSharedPreferences.getDouble('calories_$dateKey') ?? 0;
  }

  // Helper method to format date key
  String _formatDateKey(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  // Save data to SharedPreferences
  Future<void> saveData() async {
    print("Save Data FUNCTION---------->");
    String dateKey = _formatDateKey(_selectedDate);
    
    await CalSharedPreferences.setdouble('totalCalories_$dateKey', _totalCalories);
    await CalSharedPreferences.setdouble('remainingCalories_$dateKey', _remainingCalories);
    await CalSharedPreferences.setdouble('totalProteins_$dateKey', _totalProteins);
    await CalSharedPreferences.setdouble('totalFats_$dateKey', _totalFats);
    await CalSharedPreferences.setInt('lastReset', DateTime.now().millisecondsSinceEpoch);
    
    print("Data saved: Total Calories = $_totalCalories, Remaining Calories = $_remainingCalories");
    notifyListeners();
  }

  // Load data from SharedPreferences
  Future<void> loadData() async {
    print("Load Data FUNCTION---------->");
    String dateKey = _formatDateKey(_selectedDate);
    
    _totalCalories = await loadCaloriesForDate(_selectedDate);
    _totalProteins = CalSharedPreferences.getDouble('totalProteins_$dateKey') ?? 0;
    _totalFats = CalSharedPreferences.getDouble('totalFats_$dateKey') ?? 0;
    _remainingCalories = (_result ?? 0) - _totalCalories;

    int? lastReset = CalSharedPreferences.getInt('lastReset');
    if (lastReset != null) {
      DateTime lastResetDate = DateTime.fromMillisecondsSinceEpoch(lastReset);
      if (DateTime.now().difference(lastResetDate).inHours >= 24) {
        await resetTotalCalories();
      }
    }

    print("Data loaded: Total Calories = $_totalCalories, Remaining Calories = $_remainingCalories");
    notifyListeners();
  }

  // Set selected date and load its data
  Future<void> setSelectedDate(DateTime date) async {
    _selectedDate = date;
    await loadData();
    print("selectedDate---------------->$_selectedDate");
    print("totalCalories---------------->$_totalCalories");
    print("remainingCalories---------------->$_remainingCalories");
  }

  // Add calories and macros
  Future<void> addCalories(double calories, {double proteins = 0, double fats = 0}) async {
    double proteinCalories = proteins; // 1g protein = 4 calories
    double fatCalories = fats; // 1g fat = 9 calories

    double existingCalories = await loadCaloriesForDate(_selectedDate);
    _totalCalories = existingCalories + calories + proteinCalories + fatCalories;
    _totalProteins += proteins;
    _totalFats += fats;
    _remainingCalories = (_result ?? 0) - _totalCalories;

    await saveCaloriesForDate(_selectedDate, _totalCalories);
    startResetTimer();
    await saveData();
    
    print("Updated Total Calories for $_selectedDate: $_totalCalories");
    print("Remaining Calories: $_remainingCalories");
    notifyListeners();
  }

  // Start reset timer
  void startResetTimer() {
    _resetTimer?.cancel();
    _resetTimer = Timer(const Duration(hours: 24), () {
      resetTotalCalories();
    });
  }

  // Reset calories and macros
  Future<void> resetTotalCalories() async {
    print("resetTotalCalories function called");
    _totalCalories = 0;
    _totalProteins = 0;
    _totalFats = 0;
    _remainingCalories = _result ?? 0;
    
    await saveCaloriesForDate(_selectedDate, _totalCalories);
    await saveData();

    print("Total Calories Reset: $_totalCalories");
    print("Remaining Calories Reset: $_remainingCalories");
    notifyListeners();
  }

  // Initialize app
  Future<void> onAppLaunch() async {
    print("App launched---------->");
    await loadData();
  }

  // Calculate percentage for progress indicator
  double calculatePercent() {
    if (_result != null && _result! > 0) {
      print("Total Calories: $_totalCalories, BMR Result: $_result");
      return (_totalCalories / _result!).clamp(0, 1);
    }
    print("BMR Result is null or zero. Returning 0 percent.");
    return 0.0;
  }

  // Get user data from Firestore
  Future<void> getUserData() async {
    try {
      DocumentSnapshot? snapshot = await _firestoreServices.fetchUserData();
      if (snapshot != null && snapshot.exists) {
        _userData = snapshot.data() as Map<String, dynamic>;
        calculateBMR();
      } else {
        print('No user data found');
      }
    } catch (e) {
      print('Error in getUserData: $e');
    }
  }

  // Calculate BMR
  void calculateBMR() {
    if (_userData != null) {
      try {
        double weight = (_userData!['currentWeight'] as num).toDouble();
        double height = (_userData!['cm'] as num).toDouble();
        DateTime birthDate = (_userData!['DateSelection'] as Timestamp).toDate();
        int age = DateTime.now().year - birthDate.year;
        String gender = _userData!['selectedGender'] ?? '';

        if (gender == 'Male') {
          _result = 10 * weight + 6.25 * height - 5 * age + 5;
        } else if (gender == 'Female') {
          _result = 10 * weight + 6.25 * height - 5 * age - 161;
        }

        if (_remainingCalories == 0) {
          _remainingCalories = _result ?? 0;
        }

        print("Calculated BMR: $_result");
        print("Remaining calories: $_remainingCalories");
        notifyListeners();
      } catch (e) {
        print('Error during BMR calculation: $e');
      }
    }
  }

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }
}