import 'package:flutter/material.dart';
import 'package:note_app/helper/db_helper.dart';
import 'package:note_app/model/task_model.dart';
import 'package:note_app/utils/colors_manager.dart';
import 'package:note_app/widget/custom_card.dart';
import 'package:note_app/widget/custom_icon_button.dart';

class CompletedNotesScreen extends StatefulWidget {
  const CompletedNotesScreen({super.key});

  @override
  State<CompletedNotesScreen> createState() => _CompletedNotesScreenState();
}

class _CompletedNotesScreenState extends State<CompletedNotesScreen> {
  List<TaskModel> tasks = [];
  @override
  void initState() {
    DbHelper.query().then((value) {
      value.map((e) {
        if (TaskModel.fromJson(e).isCompleted == 1) {
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
        return CustomCard(task: tasks[index], actions: const []);
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.transparent,
      ),
    );
  }
}
