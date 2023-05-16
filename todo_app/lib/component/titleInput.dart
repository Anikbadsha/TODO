import 'package:flutter/material.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/customColors.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String)? callBack;

  const TextInputField({super.key,
    required this.controller,
    required this.labelText, this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CustomColor.primaryColor,
      ),
      child: TextField(
        onTap: () {
          if (callBack != null) {
            String inputData;
            callBack!( inputData=controller.text);
            print(inputData);
          }
        },
        onChanged: (value) {
          if (callBack != null) {
            callBack!(value);
          }
        },
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: myFont(
            16,
            1,
            0,
            CustomColor.wColor,
            FontWeight.normal,
          ),
        ),
        style: TextStyle(color: CustomColor.wColor),
      ),
    );
  }
}