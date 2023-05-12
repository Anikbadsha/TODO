import 'dart:convert';

import 'package:todo_app/data/url.dart';

import 'package:http/http.dart' as http;
import 'package:todo_app/model/todoModel.dart';

class GetTodoApi {
  static TodoModel? todoModel;

  static Future<void> makeAPICall() async {
    var url = Uri.parse(MyUrl.getTodoUrl); // Replace with your API endpoint

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        todoModel = TodoModel.fromJson(jsonData);

        print(jsonData);
      } else {
        // API call failed
        print('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred during API call
      print('Error: $e');
    }
  }

  static Future<void> createTodo(
      {title, note, startDate, endDate, startTime, endTime}) async {
    /// dialog

    final apiUrl = MyUrl.createTodoUrl;
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    Map<String, dynamic> requestData = {
      'title': title,
      'note': note,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startTime,
      'end_time': endTime,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 201) {
        /// dialog dissmiss
        // Todo created successfully
        var responseData = jsonDecode(response.body);
        print('Todo created: $responseData');
      } else {
        /// dialog dissmiss
        print('Failed to create todo. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle any exceptions
      print('Error occurred: $error');
    }
  }


  static Future<void> updateTask(int taskId, String title, String note, String startDate, String endDate, String startTime, String endTime) async {
    var url = Uri.parse(MyUrl.updateTodoUrl);
    var response = await http.post(url, body: {
      'id': taskId.toString(),
      'title': title,
      'note': note,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startTime,
      'end_time': endTime
    });
    if (response.statusCode == 200) {
      //TODO: Handle success response
    } else {
      //TODO: Handle error response
    }
  }
}

