
import 'package:flutter/material.dart';
import 'package:video_360/application/app_prefs.dart';
import 'package:video_360/application/injectors.dart';
import 'package:video_360/home/home_screen.dart';
import 'package:video_360/sign_in/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  AppPreferences appPreferences = instance<AppPreferences>();
  final userId = await appPreferences.getUserId();
  if (userId == null) {
    runApp(const MaterialApp(
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    ));
  } else {
    runApp(const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
