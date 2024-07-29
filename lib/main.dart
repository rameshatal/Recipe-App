import 'package:flutter/material.dart';
import 'package:food_recipe/view/screens/home_page.dart';
import 'package:food_recipe/view/screens/second_screen.dart';
import 'package:food_recipe/view/screens/three_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/HomePage",
      getPages: [
        GetPage(name: "/HomePage", page: () => const HomePage(),),
        GetPage(name: "/SecondScreen", page: () => const SecondScreen(),),
        GetPage(name: "/ThreeScreen", page: () => const ThreeScreen(),),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const FoodData(),
    );
  }
}
