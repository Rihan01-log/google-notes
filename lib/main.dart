import 'package:badge_task/model/model.dart';
import 'package:badge_task/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main()async {
WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
  Hive.registerAdapter(GoogleNotesAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
