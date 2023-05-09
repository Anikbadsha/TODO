import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddTodopage extends StatefulWidget {
  const AddTodopage({super.key});

  @override
  State<AddTodopage> createState() => _AddTodopageState();
}

class _AddTodopageState extends State<AddTodopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Title"),
          ),
          TextField(
            minLines: 5,
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(hintText: "Description"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Start Date"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Start Time"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "End Date"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "End Time"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Create Todo",
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}
