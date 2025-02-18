import 'package:cal_ai/controllers/providers/auth_provider.dart';
import 'package:cal_ai/controllers/providers/food_info_provider.dart';
import 'package:cal_ai/controllers/providers/general_provider.dart';
import 'package:cal_ai/controllers/providers/home_page_provider.dart';
import 'package:cal_ai/firebase_options.dart';
import 'package:cal_ai/utils/shared_preferences.dart';
import 'package:cal_ai/view/screens/homescreen/daily_tracking_screen.dart';
import 'package:cal_ai/view/screens/homescreens/homescreen.dart';
import 'package:cal_ai/view/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CalSharedPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => GeneralProvider()),
        ChangeNotifierProvider(create: (_) => DailyTrackingScreenProvider()),
        ChangeNotifierProvider(create: (_) => FoodInfoProvider()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: 
    // DailyTrackingScreen()
           
          SplashScreen()
          // DailyTrackingScreen()
      //   HomeScreen()

          // DailyTrackingScreen()
           
            ),
      ),
    );
  }
}
