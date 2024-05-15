import 'package:flutter/material.dart';
import 'package:note_app/utils/colors_manager.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  final Color? color;
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color = ColorsManager.purple,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      color: color,
    );
  }
}
