import 'package:flutter/material.dart';
import 'package:todo_app/component/customColors.dart';
import 'package:todo_app/service/GetTodoApiService.dart';
class MyPopupMenu extends StatefulWidget {
  const MyPopupMenu({Key? key}) : super(key: key);

  @override
  _MyPopupMenuState createState() => _MyPopupMenuState();


}

class _MyPopupMenuState extends State<MyPopupMenu> {
  String _selectedOption = '';

  Future<void> edit(BuildContext context) async {
    setState(() {
      _selectedOption = 'Edit';
      // GetTodoApi.updateTask(taskId, title, note, startDate, endDate, startTime, endTime);
    });
  }

  Future<void> delete(BuildContext context) async {
    setState(() {
      _selectedOption = 'Delete';
    });
    //TODO: Implement delete functionality
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'Edit') {
          edit(context);
        } else if (value == 'Delete') {
          delete(context);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Edit',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Delete',
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
      ],
      child: ListTile(
        title: Icon(Icons.menu,color: CustomColor.primaryColor,size: 25,)
      ),
    );
  }
}