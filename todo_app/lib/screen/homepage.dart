import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todo_app/component/customButton.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/cutomColors.dart';
import 'package:todo_app/model/todoList.dart';
import 'package:todo_app/screen/addTodoPage.dart';
import 'package:todo_app/service/GetTodoApiService.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    GetTodoApiService().fetchTodoData();
    setState(() {});
    super.initState();
  }

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
        body: Center(
            child: Text(
          "Todo List",
        )));
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(builder: (context) => AddTodopage());
    Navigator.push(context, route);
  }
}
