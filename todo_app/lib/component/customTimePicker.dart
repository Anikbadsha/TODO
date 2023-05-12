import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/customColors.dart';

class CustomTimePicker extends StatefulWidget {
  final Function(String)? callBack;
  final String? labelText;

  const CustomTimePicker(this.labelText, {Key? key, this.callBack}) : super(key: key);

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TextEditingController timeInput = TextEditingController();

  @override
  void initState() {
    timeInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: CustomColor.primaryColor),
        child: Center(
            child: TextField(
              controller: timeInput, //editing controller of this TextField
              enabled: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusColor: CustomColor.wColor,
                icon: Icon(
                  Icons.access_time,
                  color: CustomColor.wColor,
                ), //icon of text field
                labelText: widget.labelText, //label text of field
                labelStyle: myFont(16, 1, 0, CustomColor.wColor, FontWeight.normal),
              ),
              readOnly: true, //set it true, so that user will not able to edit text
              style: TextStyle(color: CustomColor.wColor),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  String formattedTime = DateFormat('HH:mm').format(
                    DateTime(2021, 1, 1, pickedTime.hour, pickedTime.minute),
                  );

                  setState(() {
                    timeInput.text = formattedTime;
                    widget.callBack!(timeInput.text); //set output time to TextField value.
                  });
                } else {
                  print("Time is not selected");
                }
              },
            )));
  }
}