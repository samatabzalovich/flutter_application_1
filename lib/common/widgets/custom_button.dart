import 'package:flutter/material.dart';
// import 'package:whatsapp_ui/common/utils/colors.dart';
// import 'package:flutter_application_6/colors.dart';
import 'package:flutter_application_1/common/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(
          color: blackColor,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: tabColor,
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
