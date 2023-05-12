import 'package:flutter/material.dart';
import 'package:todo_app/component/customColors.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/screen/homepage.dart';
import 'package:todo_app/service/GetTodoApiService.dart';

class CustomDialog {
  Future<void> dialogBuilder(BuildContext context, dynamic index) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Todo Time'),
          titleTextStyle:
              myFont(24, 0, 0, CustomColor.primaryColor, FontWeight.bold),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Start Time ::${GetTodoApi.todoModel?.data![index]?.startTime}",
                  style: (myFont(
                      16, 0, 0, CustomColor.primaryColor, FontWeight.normal)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "End Time ::${GetTodoApi.todoModel?.data![index]?.startTime}",
                  style: (myFont(
                      16, 0, 0, CustomColor.primaryColor, FontWeight.normal)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child:  Text('Dismiss',style: myFont(16,1,0,CustomColor.primaryColor,FontWeight.bold),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
