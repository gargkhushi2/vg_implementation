import 'package:after_market_mobile_application/constants/app_style.dart';
import 'package:after_market_mobile_application/helper/preferences.dart';
import 'package:after_market_mobile_application/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing the preferences
  await Preferences.instance.initPrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'After Market Mobile Application',
      theme: AppStyle.appTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.reviewForm,
      onGenerateRoute: AppRoutes.getRoutes,
    );
  }
}
