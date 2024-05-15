import 'package:flutter/material.dart';
import 'package:note_app/helper/cache_helper.dart';
import 'package:note_app/helper/db_helper.dart';
import 'package:note_app/screens/home_layout.dart';
import 'package:note_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: getThemeMode(),
    );
  }
}

//! null =>
//! true => dark
//! false => light

ThemeMode getThemeMode() {
  bool? isDark = CacheHelper.getDataBool(key: "isDark");
  if (isDark == null) {
    return ThemeMode.system;
  } else if (isDark) {
    return ThemeMode.dark;
  } else {
    return ThemeMode.light;
  }
}
