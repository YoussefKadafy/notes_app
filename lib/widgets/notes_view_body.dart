import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/widgets/custom_note_item.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(
        height: 50,
      ),
      CustomAppBar(),
      SizedBox(
        height: 20,
      ),
      Expanded(child: NotesViewBuilder()),
    ]);
  }
}
