import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todo_app/component/customButton.dart';
import 'package:todo_app/component/customCard.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/customColors.dart';
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
    GetTodoApi.makeAPICall();
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColor.primaryColor,
          title: Text("${GetTodoApi.todoModel?.message}"),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("My Todo List",style: myFont(18,0,0,CustomColor.primaryColor,FontWeight.w700),),
              Icon(Icons.add_task,color: CustomColor.primaryColor,),
            ],),

            CustomCard(),
          ],),
        ),);
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(builder: (context) => AddTodopage());
    Navigator.push(context, route);
  }
}
