import 'package:flutter/material.dart';
import 'package:todo_app/component/customButton.dart';
import 'package:todo_app/component/customColors.dart';
import 'package:todo_app/component/customDatePicker.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/titleInput.dart';
import 'package:todo_app/service/GetTodoApiService.dart';

import '../component/customTimePicker.dart';
import 'homepage.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColor.primaryColor,
          title: Text("Create Todo Here",
              style: myFont(22, 0, 0, CustomColor.wColor, FontWeight.w800)),
          centerTitle: true,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),

              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(0xff224957),
                    width: 2,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xff224957).withOpacity(0.3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add Todos From Here",
                    style: myFont(
                        24, 0, 1, CustomColor.primaryColor, FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    child: const SizedBox(
                      height: 16,
                    ),
                  ),
                  Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextInputField(
                              controller: titleController, labelText: "Title"),
                          const SizedBox(
                            height: 12,
                          ),
                          TextInputField(
                              controller: descriptionController,
                              labelText: "Description"),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomDatePicker(
                            "Start Date",
                            callBack: (value) {
                              setState(() {
                                startDateController.text = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomDatePicker(
                            "End Date",
                            callBack: (value) {
                              setState(() {
                                endDateController.text = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTimePicker(
                            "Start Time",
                            callBack: (value) {
                              startTimeController.text = value;
                              print("Selected Start Time: $value");
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTimePicker(
                            "End Time",
                            callBack: (value) {
                              endTimeController.text = value;
                              print("Selected End Time: $value");
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    CustomColor.primaryColor,
                    12,
                    "Create todo",
                    onTap: () {
                      setState(() {
                        GetTodoApi.createTodo(
                          title: titleController.text,
                          note: descriptionController.text,
                          startDate: startDateController.text,
                          endDate: endDateController.text,
                          startTime: startTimeController.text,
                          endTime: endTimeController.text,
                        );
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => HomePage()));
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
