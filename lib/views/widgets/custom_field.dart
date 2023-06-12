import 'package:flutter/material.dart';

import '../../utilities/stock_colors.dart';

class CustomField extends StatefulWidget {
  final String title, hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputType;
  const CustomField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.inputType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  @override
  CustomFieldState createState() => CustomFieldState();
}

class CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: widget.inputType,
          controller: widget.controller,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: SC.border),
              borderRadius: BorderRadius.circular(3),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: SC.accent1),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          obscureText: widget.isPassword,
        ),
      ],
    );
  }
}
