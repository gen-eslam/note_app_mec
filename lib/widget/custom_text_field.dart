import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final int? maxLine;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key, required this.title, this.maxLine = 1, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }
}
