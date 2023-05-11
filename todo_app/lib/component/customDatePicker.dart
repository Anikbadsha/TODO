import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/cutomColors.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(String)? callBack;
  final String? labelText;

  const CustomDatePicker(this.labelText, {super.key, this.callBack});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
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
          controller: dateinput, //editing controller of this TextField
          enabled: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusColor: CustomColor.wColor,
            icon: Icon(
              Icons.calendar_today,
              color: CustomColor.wColor,
            ), //icon of text field
            labelText: widget.labelText, //label text of field
            labelStyle: myFont(16, 1, 0, CustomColor.wColor, FontWeight.normal),
          ),
          readOnly: true, //set it true, so that user will not able to edit text
          style: TextStyle(color: CustomColor.wColor),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);

              setState(() {
                dateinput.text = formattedDate;

                widget.callBack!(
                    dateinput.text); //set output date to TextField value.
              });
            } else {
              print("Date is not selected");
            }
          },
        )));
  }
}
