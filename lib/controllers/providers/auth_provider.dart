import 'package:cal_ai/services/auth_services.dart';
import 'package:cal_ai/services/firestore_services.dart';
import 'package:cal_ai/utils/shared_preferences.dart';
import 'package:cal_ai/view/screens/homescreens/homescreen.dart';
import 'package:cal_ai/view/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AuthenticationProvider extends ChangeNotifier {
  // Services
  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirestoreServices _firestoreServices = FirestoreServices();

  //< -----------------------------------------------------------------> for specific data fetch

  // State variables
  Map<String, dynamic>? _userData;
  double? _calorieGoal;
  double? _proteinGoal;
  double? _carbsGoal;
  double? _fatsGoal;
  double? _consumedCalories = 0;
  //consumed amount
  double? _consumedProtein = 0;
  double? _consumedCarbs = 0;
  double? _consumedFats = 0;
  bool _isLoading = false;
  bool get isLoading => _isLoading;


  User? _user;
  // Getters for goals
  get calorieGoal => _calorieGoal;
  void setGoal(double value){
    _calorieGoal = value;
    notifyListeners();
  }
  get proteinGoal => _proteinGoal;
  get carbsGoal => _carbsGoal;
  get fatsGoal => _fatsGoal;

  // Getters for consumed amounts
  get consumedCalories => _consumedCalories ?? 0.0;
  get consumedProtein => _consumedProtein ?? 0.0;
  get consumedCarbs => _consumedCarbs ?? 0.0;
  get consumedFats => _consumedFats ?? 0.0;

  // Getters for basic properties
  get remainingCalories {
    if (_calorieGoal != null && _consumedCalories != null) {
      print(
          "remaing calories------------>${(_calorieGoal! - _consumedCalories!).clamp(0.0, double.infinity)}");
      return (_calorieGoal! - _consumedCalories!).clamp(0.0, double.infinity);
    }
    return 0.0;
  }

  double get remainingProtein {
    if (_proteinGoal != null && _consumedProtein != null) {
      print(
          "remaing proteins------------>${(_proteinGoal! - _consumedProtein!).clamp(0.0, double.infinity)}");

      return (_proteinGoal! - _consumedProtein!).clamp(0.0, double.infinity);
    }
    return 0.0;
  }

  double get remainingCarbs {
    if (_carbsGoal != null && _consumedCarbs != null) {
      print(
          "remaing carbs------------>${(_carbsGoal! - _consumedCarbs!).clamp(0.0, double.infinity)}");

      return (_carbsGoal! - _consumedCarbs!).clamp(0.0, double.infinity);
    }
    return 0.0;
  }

  double get remainingFats {
    if (_fatsGoal != null && _consumedFats != null) {
      print(
          "remaing fats------------>${(_fatsGoal! - _consumedFats!).clamp(0.0, double.infinity)}");

      return (_fatsGoal! - _consumedFats!).clamp(0.0, double.infinity);
    }
    return 0.0;
  }

  double calculateProteinPercent() {
    if (_proteinGoal == null || _proteinGoal == 0) return 0.0;
    double percent = _consumedProtein! / _proteinGoal!;
    return percent.clamp(0.0, 1.0);
  }

  double calculateCarbsPercent() {
    if (_carbsGoal == null || _carbsGoal == 0) return 0.0;
    double percent = _consumedCarbs! / _carbsGoal!;
    return percent.clamp(0.0, 1.0);
  }

  double calculateFatsPercent() {
    if (_fatsGoal == null || _fatsGoal == 0) return 0.0;
    double percent = _consumedFats! / _fatsGoal!;
    return percent.clamp(0.0, 1.0);
  }

  void addConsumedProtein(double protein) {
    _consumedProtein = (_consumedProtein ?? 0) + protein;
    notifyListeners();
  }

  void addConsumedCarbs(double carbs) {
    _consumedCarbs = (_consumedCarbs ?? 0) + carbs;
    notifyListeners();
  }

  void addConsumedFats(double fats) {
    _consumedFats = (_consumedFats ?? 0) + fats;
    notifyListeners();
  }

  User? get user => _user;

  // Getters for macronutrients
  double? get calories => _userData?['calories']?.toDouble();
  double? get protein => _userData?['protein']?.toDouble();
  double? get carbs => _userData?['carbs']?.toDouble();
  double? get fats => _userData?['fats']?.toDouble();

  // Getters and setters for userData
  Map<String, dynamic>? get userData => _userData;
  set userData(Map<String, dynamic>? value) {
    _userData = value;
    notifyListeners();
  }

  // Setter for consumed calories
  set doubleconsumedCalories(double? value) {
    _consumedCalories = value;
    notifyListeners();
  }

  // Calculate percentage of calories consumed
  double calculateCaloriePercent() {
    if (_calorieGoal == null || _calorieGoal == 0) return 0.0;

    // Calculate percentage consumed
    double percent = _consumedCalories! / _calorieGoal!;

    // Ensure percent is between 0 and 1
    if (percent < 0) return 0.0;
    if (percent > 1) return 1.0;

    print("Consumed percentage: $percent");
    print("Remaining calories: ${remainingCalories}");

    return percent;
  }

  // Calculate macronutrients based on user data
  Map<String, dynamic> calculateMacronutrients(Map<String, dynamic> userData) {
    // Parse basic user data
    double weight = double.parse(userData['weight'].toString());
    double height = double.parse(userData['cm'].toString());
    DateTime dateOfBirth = DateTime.parse(userData['DateSelection'].toString());

    // Calculate age
    DateTime now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }

    // Calculate BMR based on gender
    double bmr;
    if (userData['selectedGender'] == 'Male') {
      bmr = 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      bmr = 10 * weight + 6.25 * height - 5 * age - 161;
    }

    // Calculate TDEE and calorie goal
    double tdee = bmr * 1.55;
    _calorieGoal = tdee - 500;

    // Calculate macronutrients
    double protein = (_calorieGoal! * 0.30) / 4;
    double carbs = (_calorieGoal! * 0.40) / 4;
    double fats = (_calorieGoal! * 0.30) / 9;

    // Round all values
    protein = double.parse(protein.toStringAsFixed(2));
    carbs = double.parse(carbs.toStringAsFixed(2));
    fats = double.parse(fats.toStringAsFixed(2));
    _calorieGoal = double.parse(_calorieGoal!.toStringAsFixed(2));

    return {
      'calories': _calorieGoal,
      'protein': protein,
      'carbs': carbs,
      'fats': fats,
    };
  }

  // Google Sign-in
  Future<void> signInWithGoogle(
    BuildContext context,
    Map<String, dynamic> userData,
  ) async {
    debugPrint("Sign in");
    try {
      _user = await _firebaseAuthServices.signInWithGoogle();
      print("User-------->${_user?.email}");
      print("uiddd------------->${_user?.uid}");

      if (_user != null) {
        // Save user ID
        await CalSharedPreferences.setString('uid', _user?.uid ?? '');
        print("UID saved: ${await CalSharedPreferences.getString('uid')}");

        // Calculate and save macronutrients
        Map<String, dynamic> macronutrients = calculateMacronutrients(userData);
        print("data----->${macronutrients}");
        print("Calculated Macronutrients: $macronutrients");

        await _firestore
            .collection('userdata')
            .doc(_user?.uid) // Store user data under userId
            .set(macronutrients,
                SetOptions(merge: true)); // Merges with existing data

        // String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

        // await _firestore
        //     .collection('userdata')
        //     .doc(_user?.uid)
        //     .collection("userlogs").add(macronutrients);
        // .doc(todayDate)
        // .set(macronutrients);

        // await _firestore
        //     .collection('userdata')
        //     .doc(_user?.uid)
        //     .collection("userlogs")
        //     .doc(todayDate)
        //     .collection("history")
        //     .doc(todayDate)
        //     .set(macronutrients);

        // Set login status
        await CalSharedPreferences.setBool('isLoggedIn', true);
        print(
            "isLoggedIn saved: ${await CalSharedPreferences.getBool('isLoggedIn')}");

        // Notify listeners about the user change
        notifyListeners();

        // Navigate to home screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        print("DailyTrackingScreen----------");
      } else {
        // Navigate to splash screen if sign-in failed
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SplashScreen()));
        print("SplashScreen----------");
      }

      notifyListeners();
    } catch (e) {
      debugPrint("error $e");
    }
  }

  // Fetch user data from Firestore
  Future<void> getUserData() async {
    try {
      DocumentSnapshot? snapshot = await _firestoreServices.fetchUserData();
      print("user data------->${snapshot.toString()}");
      if (snapshot != null && snapshot.exists) {
        _userData = snapshot.data() as Map<String, dynamic>;
        print("USER data-------------->$_userData");

        // Set goals from Firestore data
        if (_userData!.containsKey('calories')) {
          _calorieGoal = _userData!['calories']?.toDouble();
        }
        if (_userData!.containsKey('protein')) {
          _proteinGoal = _userData!['protein']?.toDouble();
        }
        if (_userData!.containsKey('carbs')) {
          _carbsGoal = _userData!['carbs']?.toDouble();
        }
        if (_userData!.containsKey('fats')) {
          _fatsGoal = _userData!['fats']?.toDouble();
        }

        // Load today's consumed nutrients
        DateTime today = DateTime.now();
        await loadConsumedNutrientsForDate(today);

        print('User data and nutrients loaded');
        notifyListeners();
      }
    } catch (e) {
      print('Error in getUserData: $e');
    }
  }

  // Modified reset method
  void _resetConsumedValues() {
   
    _consumedCalories = 0.0;
    _consumedProtein = 0.0;
    _consumedCarbs = 0.0;
    _consumedFats = 0.0;
    notifyListeners();
  }

  Future<void> loadConsumedNutrientsForDate(DateTime date) async {
    print("loadConsumedNutrientsForDate function called----------");
    try {
      print("loadConsumedNutrientsForDate----------${date}");
      _isLoading = true;
      notifyListeners();

      // 1. Reset all consumed values to 0 when loading new date
       _resetConsumedValues();

      String uid = await CalSharedPreferences.getString('uid');
      if (uid.isEmpty) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      // 2. Format the date to YYYY-MM-DD for Firestore
      final normalizedDate = DateTime(date.year, date.month, date.day);
      print("normalizedDate----------${normalizedDate}");
      String dateStr = DateFormat('yyyy-MM-dd').format(normalizedDate);

      print('Loading data for date: $dateStr');

      // 3. Try to get data for this specific date
      QuerySnapshot snapshot = await _firestore
          .collection('userdata')
          .doc(uid)
          .collection('userlogs')
          .doc(dateStr)
          .collection('history')
          .get();
        

      // 4. If no data exists for this date, keep the zeros
      if (snapshot.docs.isEmpty) {
        print('No data found for date: $dateStr');
        _consumedCalories = 0;
        _consumedProtein = 0;
        _consumedCarbs = 0;
        _consumedFats = 0;
        _isLoading = false;
        notifyListeners();
        return;
      }

      // 5. If data exists, sum up all entries for this date
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        print("data is ------------>$data");
        _consumedCalories = (_consumedCalories ?? 0) + (data['calories'] ?? 0);
        _consumedProtein = (_consumedProtein ?? 0) + (data['proteins'] ?? 0);
        _consumedCarbs = (_consumedCarbs ?? 0) + (data['carbs'] ?? 0);
        _consumedFats = (_consumedFats ?? 0) + (data['fats'] ?? 0);
      }

      print('Updated nutrients for $dateStr:');
      print('Calories-------------------------------------> $_consumedCalories');
      print('Protein: $_consumedProtein');
      print('Carbs: $_consumedCarbs');
      print('Fats: $_consumedFats');
      notifyListeners();
    } catch (e) {
      print('Error loading consumed nutrients: $e');
      _resetConsumedValues();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
