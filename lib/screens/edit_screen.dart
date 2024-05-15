import 'package:flutter/material.dart';
import 'package:note_app/helper/db_helper.dart';
import 'package:note_app/model/task_model.dart';
import 'package:note_app/screens/home_layout.dart';
import 'package:note_app/utils/colors_manager.dart';
import 'package:note_app/widget/color/color_controller.dart';
import 'package:note_app/widget/custom_text_field.dart';
import 'package:note_app/widget/color/plate_color.dart';

class EditNoteScreen extends StatefulWidget {
  final TaskModel taskModel;
  const EditNoteScreen({super.key, required this.taskModel});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  ColorController colorController = ColorController(
    colors: ColorsManager.colors,
  );
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.taskModel.title;
    noteController.text = widget.taskModel.note;
    colorController.selectedIndex = widget.taskModel.color;

    super.initState();
  }

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
          "Edit Note",
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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    onPressed: () {
                      DbHelper.updateRecord(
                        widget.taskModel.copyWith(
                          title: titleController.text,
                          note: noteController.text,
                          color: colorController.selectedIndex,
                        ),
                      ).then((value) {
                        print('update $value');
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeLayout(),
                          ),
                        );
                      });
                    },
                    child: const Text(
                      "Edit Note",
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.transparent,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => const HomeLayout(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      "Cancle",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
