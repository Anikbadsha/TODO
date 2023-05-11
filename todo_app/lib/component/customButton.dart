import 'package:flutter/material.dart';
import 'package:todo_app/component/customFont.dart';
import 'package:todo_app/component/cutomColors.dart';

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
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.06,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: CustomColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {},
          child: Text(
            "$buttonText",
            style: myFont(18, 0, 1, CustomColor.wColor, FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
