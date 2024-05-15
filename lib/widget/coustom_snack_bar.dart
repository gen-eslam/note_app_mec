import 'package:flutter/material.dart';
import 'package:note_app/utils/colors_manager.dart';

SnackBar getSnackBar(Widget content, BuildContext context) {
  return SnackBar(
    content: content ,
    backgroundColor: ColorsManager.purple,
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: "cancel",
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    duration: const Duration(seconds: 3),
  );
}
