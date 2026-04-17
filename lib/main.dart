import 'package:adixion/Core/Controller.dart/themecontroller.dart';
import 'package:adixion/Presentation/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeController.theme,

        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: "Rubik",
          scaffoldBackgroundColor: Colors.white,
        ),

        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Rubik",
          scaffoldBackgroundColor: Colors.black,
        ),

        home: AnimatedSplashScreen(),
      ),
    );
  }
}
