import 'package:flutter/material.dart';
import 'package:note_app/utils/colors_manager.dart';
import 'package:note_app/widget/color/color_controller.dart';

class PlateColor extends StatefulWidget {
  final ColorController colorController;
  const PlateColor({super.key, required this.colorController});

  @override
  State<PlateColor> createState() => _PlateColorState();
}

class _PlateColorState extends State<PlateColor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.colorController.colors.length,
        (index) => ColorItem(
          onTap: () {
            widget.colorController.selectedIndex = index;
            setState(() {});
          },
          colorController: widget.colorController,
          index: index,
        ),
      ),
    );
  }
}

class ColorItem extends StatefulWidget {
  final int index;
  final ColorController colorController;
  final Function() onTap;
  const ColorItem({
    super.key,
    required this.index,
    required this.colorController,
    required this.onTap,
  });

  @override
  State<ColorItem> createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.colorController.colors[widget.index],
          shape: BoxShape.circle,
        ),
        height: 50,
        width: 50,
        child: widget.colorController.selectedIndex == widget.index
            ? const Icon(
                Icons.check,
                color: ColorsManager.white,
              )
            : null,
      ),
    );
  }
}
