import 'package:flutter/material.dart';
import 'package:todo_app/component/my_context.dart';
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
      navigatorKey: GetContext.navigatorKey,
      home: HomePage(),
    );
  }
}
