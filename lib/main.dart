import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screen/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splashscreen",
      getPages: [
        GetPage(name: "/splashscreen", page: () => SplashScreen()),
        GetPage(name: "/home", page: () => HomeScreen(),transition: Transition.rightToLeft)
      ],
    );
  }
}