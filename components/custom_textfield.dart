import 'package:flutter/material.dart';

import 'global.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({super.key, this.hintText});

  final String? hintText;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: AppColors.textColor),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
      ),
    );
  }
}
