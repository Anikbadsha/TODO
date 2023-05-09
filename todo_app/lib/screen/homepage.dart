import 'package:flutter/material.dart';
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
      appBar: AppBar(centerTitle: true, title: const Text("TO DO APP")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: Text("add todo"),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(builder: (context) => AddTodopage());
    Navigator.push(context, route);
  }
}
