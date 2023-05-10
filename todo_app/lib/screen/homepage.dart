import 'package:flutter/material.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/cutomColors.dart';
import 'package:todo_app/screen/addTodoPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        title: Text("Todo List",
            style: myFont(22, 0, 0, CustomColor.wColor, FontWeight.w800)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: CustomColor.primaryColor,
        onPressed: navigateToAddPage,
        label: Text(
          "add todo",
          style: myFont(22, 0, 0, CustomColor.wColor, FontWeight.w800),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(child: Text("TODO LIST")),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(builder: (context) => AddTodopage());
    Navigator.push(context, route);
  }
}
