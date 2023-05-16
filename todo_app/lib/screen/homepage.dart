import 'package:flutter/material.dart';
import 'package:todo_app/component/customCard.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/customColors.dart';
import 'package:todo_app/screen/addTodoPage.dart';
import 'package:todo_app/service/GetTodoApiService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshTodoList();
  }

   Future<void> refreshTodoList() async {
    setState(() {
      isLoading = true;
    });

    await GetTodoApi.makeAPICall();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        title: Text("${GetTodoApi.todoModel?.message ?? ''}"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Todo List",
                    style: myFont(
                      18,
                      0,
                      0,
                      CustomColor.primaryColor,
                      FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: navigateToAddPage,
                    icon: Icon(
                      Icons.add_task,
                      color: CustomColor.primaryColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : CustomCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(builder: (context) => const AddTodoPage());
    Navigator.push(context, route).then((value) {
      // Executed when the AddTodoPage is popped and returned to this page
      refreshTodoList();
    });
  }
}