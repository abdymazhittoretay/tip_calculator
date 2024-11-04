// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tip_calculator/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 243, 242, 248),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.blue,
            selectionColor: Colors.blue[100],
            selectionHandleColor: Colors.blue,
          ),
          sliderTheme: SliderThemeData(
            overlayShape: SliderComponentShape
                .noOverlay, // Remove any overlay shape if you want
            trackShape: RectangularSliderTrackShape(),
          )),
      home: HomePage(),
    );
  }
}
