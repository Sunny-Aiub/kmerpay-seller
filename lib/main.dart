import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kookit_delivery/splash/presentation/pages/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home:  const SplashScreen(),
    );
  }
}

