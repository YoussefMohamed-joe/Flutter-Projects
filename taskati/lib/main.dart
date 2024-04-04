import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/themes/app_themes.dart';
import 'package:taskati/features/add-task/model/task_model.dart';
import 'package:taskati/features/splash_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('UserBox');
  await Hive.openBox<TaskModel>('TaskBox');
  AppLocalStorage().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: Hive.box('UserBox').listenable(),
      builder: (context, box, child) {
        final isLighTheme = box.get('theme')?? true;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isLighTheme? AppThemes.lightTheme:AppThemes.darkTheme,
          home: const SplashView(),
        );     
      },
       
    );
  }
}

