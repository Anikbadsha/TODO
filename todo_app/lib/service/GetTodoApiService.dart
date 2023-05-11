import 'dart:convert';
import 'dart:html';

import 'package:todo_app/data/url.dart';

import 'package:http/http.dart' as http;
import 'package:todo_app/model/todoList.dart';

class GetTodoApiService {
  List<GetTodo> todoList = [];
  fetchTodoData() async {
    var link = "https://genieinfo.tech/task/api/todo/create";

    var response = await http.get(Uri.parse(link));

    print("Response is ${response}");
  }
}
