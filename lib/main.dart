import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        NotesView.id: (context) => NotesView(),
      },
      initialRoute: NotesView.id,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
    );
  }
}
