import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            CustomTextField(
              hint: 'title',
            ),
            CustomTextField(
              hint: 'content',
              maxlines: 5,
            ),
            CustomButton()
          ],
        ),
      ),
    );
  }
}
