import 'package:flutter/material.dart';
import 'package:note_app/helper/cache_helper.dart';
import 'package:note_app/model/screen_model.dart';
import 'package:note_app/screens/add_note_screen.dart';
import 'package:note_app/screens/all_note_sreen.dart';
import 'package:note_app/screens/completed_notes_screen.dart';
import 'package:note_app/utils/colors_manager.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<ScreenModel> screenModels = [
    ScreenModel(
      title: 'All',
      screen: const AllNoteScreen(),
    ),
    ScreenModel(
      title: 'Completed',
      screen: const CompletedNotesScreen(),
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.purpleLight,
      appBar: AppBar(
        backgroundColor: ColorsManager.purple,
        title: Text(
          screenModels[currentIndex].title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // bool? isDark = CacheHelper.getDataBool(key: "isDark");
                // if (isDark == null || isDark == false) {
                //   CacheHelper.putData(key: "isDark", value: true);
                // } else {
                //   CacheHelper.putData(key: "isDark", value: false);
                // }
                // ScaffoldMessenger.of(context).showSnackBar(
                //  );
              },
              icon: const Icon(Icons.dark_mode))
        ],
      ),
      body: screenModels[currentIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.purple,
        shape: const StadiumBorder(),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: ColorsManager.white,
        ),
      ),
    );
  }
}
