import 'package:flutter/material.dart';
import 'package:note_app/helper/db_helper.dart';
import 'package:note_app/model/task_model.dart';
import 'package:note_app/screens/home_layout.dart';
import 'package:note_app/utils/colors_manager.dart';
import 'package:note_app/widget/color/color_controller.dart';
import 'package:note_app/widget/custom_text_field.dart';
import 'package:note_app/widget/color/plate_color.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  ColorController colorController = ColorController(
    colors: ColorsManager.colors,
  );
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.purpleLight,
      appBar: AppBar(
        leading: BackButton(
            color: ColorsManager.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeLayout(),
                ),
              );
            }),
        title: const Text(
          "Add Note",
          style: TextStyle(color: ColorsManager.white),
        ),
        backgroundColor: ColorsManager.purple,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              title: "Title",
              controller: titleController,
            ),
            const SizedBox(height: 30),
            CustomTextField(
              title: "Discription",
              maxLine: 5,
              controller: noteController,
            ),
            const SizedBox(height: 30),
            PlateColor(
              colorController: colorController,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  50,
                ),
              ),
              onPressed: () {
                DbHelper.insert(TaskModel(
                  title: titleController.text,
                  note: noteController.text,
                  color: colorController.selectedIndex,
                )).then((value) {
                  print('inserted $value');
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeLayout(),
                    ),
                  );
                });
              },
              child: const Text(
                "Add Note",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
