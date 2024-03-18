import 'package:demo2/homepage.dart';
import 'package:demo2/slider.dart';
import 'package:demo2/checkerboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/slider": (context) => const SliderScreen(),
        "/checkerboard": (context) => const CheckerboardScreen(),
      },
    );
  }
}
