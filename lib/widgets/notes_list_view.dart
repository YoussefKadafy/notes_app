import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesViewBuilder extends StatelessWidget {
  const NotesViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: NoteIetem(),
      );
    });
  }
}
