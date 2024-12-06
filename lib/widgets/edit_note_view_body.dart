import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          icon: Icons.check,
          title: 'Edit Note',
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextField(
          hint: 'title',
        ),
        CustomTextField(
          hint: 'content',
          maxlines: 5,
        ),
      ],
    );
  }
}
