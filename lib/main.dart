import 'package:bmi_app/home.dart';
import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
          // size: 90,
        ),
        textTheme: TextTheme(
            headline1: const TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            headline2: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyText1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
      // home: Result(age: 20, isMale: true, result: 69.4),
      home: MyHomePage(),
    );
  }
}
