import 'package:flutter/material.dart';
import 'package:todo_app/component/customButton.dart';
import 'package:todo_app/component/customCard.dart';
import 'package:todo_app/component/customDatePicker.dart';
import 'package:todo_app/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
