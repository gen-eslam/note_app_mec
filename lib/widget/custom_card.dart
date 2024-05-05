import 'package:flutter/material.dart';
import 'package:note_app/model/task_model.dart';
import 'package:note_app/utils/colors_manager.dart';

class CustomCard extends StatelessWidget {
  final TaskModel task;
  final List<Widget> actions;

  const CustomCard({super.key, this.actions = const [], required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorsManager.colors[task.color],
      elevation: 5,
      color: ColorsManager.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    task.note,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
