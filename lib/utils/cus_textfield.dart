import 'package:flutter/material.dart';
import '../customWidgets/textStyle.dart';
import '../theme/theme_helper.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title; // This is like "Registered Company Name"
  final String label; // This is like "Enter registered company name"
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.label,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: CustomTextStyle.body(color: PrimaryColors().black900),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: PrimaryColors().black900),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: PrimaryColors().gray60003),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: PrimaryColors().gray60003),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: PrimaryColors().gray60003),
            ),
          ),
        ),
      ],
    );
  }
}
