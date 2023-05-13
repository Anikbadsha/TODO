import 'package:flutter/material.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/customColors.dart';

class CustomButton extends StatelessWidget {
  final Color? buttonColor;
  final String? buttonText;
  final double? borderRadius;
  final VoidCallback? onTap;

  const CustomButton(this.buttonColor, this.borderRadius, this.buttonText,
      {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height*0.06,
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: CustomColor.primaryColor),
        child: Center(
          child: Text(
            "$buttonText",
            style: myFont(18, 0, 1, CustomColor.wColor, FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
