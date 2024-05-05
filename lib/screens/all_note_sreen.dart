import 'package:flutter/material.dart';
import 'package:note_app/helper/db_helper.dart';
import 'package:note_app/model/task_model.dart';
import 'package:note_app/screens/edit_screen.dart';
import 'package:note_app/utils/colors_manager.dart';
import 'package:note_app/widget/custom_card.dart';
import 'package:note_app/widget/custom_icon_button.dart';

class AllNoteScreen extends StatefulWidget {
  const AllNoteScreen({super.key});

  @override
  State<AllNoteScreen> createState() => _AllNoteScreenState();
}

class _AllNoteScreenState extends State<AllNoteScreen> {
  List<TaskModel> tasks = [];
  @override
  void initState() {
    DbHelper.query().then((value) {
      value.map((e) {
        if (TaskModel.fromJson(e).isCompleted == 0) {
          tasks.add(TaskModel.fromJson(e));
        }
      }).toList();

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) {
        return CustomCard(
          task: tasks[index],
          actions: [
            CustomIconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => EditNoteScreen(
                      taskModel: tasks[index],
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
            CustomIconButton(
              onPressed: () {
                DbHelper.updateRecord(
                  tasks[index].copyWith(
                    isCompleted: 1,
                  ),
                ).then((value) {
                  tasks.removeAt(index);
                  setState(() {});
                });
              },
              color: ColorsManager.green,
              icon: const Icon(
                Icons.check_circle_outline_rounded,
              ),
            ),
            CustomIconButton(
              onPressed: () {
                DbHelper.delete(tasks[index]).then((value) {
                  tasks.removeAt(index);
                  setState(() {});
                });
              },
              color: ColorsManager.red,
              icon: const Icon(
                Icons.delete_outline_rounded,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.transparent,
      ),
    );
  }
}
