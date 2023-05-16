import 'package:flutter/material.dart';
import 'package:todo_app/component/customButton.dart';
import 'package:todo_app/component/customColors.dart';
import 'package:todo_app/component/customDatePicker.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/titleInput.dart';
import 'package:todo_app/model/todoModel.dart';

import '../component/customTimePicker.dart';
import '../service/GetTodoApiService.dart';
import 'homepage.dart';

class EditTodoPage extends StatefulWidget {
  final TodoData? todoData;


  const EditTodoPage({super.key, this.todoData});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  TextEditingController? startDateController;
  TextEditingController? endDateController;
  TextEditingController? startTimeController;
  TextEditingController? endTimeController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.todoData?.title ?? "");
    descriptionController =
        TextEditingController(text: widget.todoData?.note ?? "");
    startDateController =
        TextEditingController(text: widget.todoData?.startDate ?? "");
    endDateController =
        TextEditingController(text: widget.todoData?.endDate ?? "");
    startTimeController =
        TextEditingController(text: widget.todoData?.startTime ?? "");
    endTimeController =
        TextEditingController(text: widget.todoData?.endTime ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColor.primaryColor,
          title: Text("Edit Todo Here",
              style: myFont(22, 0, 0, CustomColor.wColor, FontWeight.w800)),
          centerTitle: true,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            height: MediaQuery.of(context).size.height * 0.80,
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
                  "Edit Todos From Here",
                  style: myFont(
                      24, 0, 1, CustomColor.primaryColor, FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                    key: formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextInputField(
                              controller: titleController!, labelText: "Title"),
                          const SizedBox(
                            height: 12,
                          ),
                          TextInputField(
                              controller: descriptionController!,
                              labelText: "Description"),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomDatePicker(
                            "Start Date",
                            callBack: (value) {
                              setState(() {
                                startDateController?.text = value;
                              });
                            },
                            date: widget.todoData?.startDate,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomDatePicker(
                            "End Date",
                            callBack: (value) {
                              setState(() {
                                endDateController?.text = value;
                              });
                            },
                            date: widget.todoData?.endDate,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTimePicker(
                            "Start Time",
                            callBack: (value) {
                              startTimeController?.text = value;
                              print("Selected Start Time: $value");
                            },
                            time: widget.todoData?.startTime,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTimePicker(
                            "End Time",
                            callBack: (value) {
                              endTimeController?.text = value;
                              print("Selected End Time: $value");
                            },
                            time: widget.todoData?.endTime,
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  CustomColor.primaryColor,
                  12,
                  "Update Todo",
                  onTap: () {
                    setState(() {
                      GetTodoApi.updateTask(
                          int.parse("${widget.todoData?.id}"),
                          titleController!.text,
                          descriptionController!.text,
                          startDateController!.text,
                          endDateController!.text,
                          startTimeController!.text,
                          endTimeController!.text);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));

                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
