import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todo_app/component/customButton.dart';
import 'package:todo_app/component/customDatePicker.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/cutomColors.dart';

class AddTodopage extends StatefulWidget {
  const AddTodopage({super.key});

  @override
  State<AddTodopage> createState() => _AddTodopageState();
}

class _AddTodopageState extends State<AddTodopage> {
  final GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController TitleInputcontroller = TextEditingController();
  TextEditingController DescriptionInputController = TextEditingController();
  TextEditingController dateInputController = TextEditingController();

  bool _isobscure = true;

  @override
  void initState() {
    dateInputController.text = ""; //set the initial value of text field
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
          title: Text("Create Todo Here",
              style: myFont(22, 0, 0, CustomColor.wColor, FontWeight.w800)),
          centerTitle: true,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xff224957), width: 2, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(16),
              color: Color(0xff224957).withOpacity(0.3),
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
                SizedBox(
                  height: 16,
                ),
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: TitleInputcontroller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              hintStyle: myFont(16, 0, 0, CustomColor.wColor,
                                  FontWeight.w600),
                              hintText: "Title",
                              filled: true,
                              fillColor: CustomColor.primaryColor),
                          style: TextStyle(color: CustomColor.wColor),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          minLines: 3,
                          maxLines: 5,
                          controller: DescriptionInputController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              hintStyle: myFont(16, 0, 0, CustomColor.wColor,
                                  FontWeight.w600),
                              hintText: "Description",
                              filled: true,
                              fillColor: CustomColor.primaryColor),
                          style: TextStyle(color: CustomColor.wColor),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        CustomDatePicker("Start Date"),
                        SizedBox(
                          height: 12,
                        ),
                        CustomDatePicker("End Date"),
                      ],
                    )),
                SizedBox(
                  height: 16,
                ),
                customButton(
                  CustomColor.primaryColor,
                  12,
                  "Create todo",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
