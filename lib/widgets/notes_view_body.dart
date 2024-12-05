import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/views/notes_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        CustomAppBar(),
        SizedBox(
          height: 20,
        ),
        NoteIetem(),
      ],
    );
  }
}

class NoteIetem extends StatelessWidget {
  const NoteIetem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 16,
        start: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xffFFCC80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              'Flutter Tips',
              style: TextStyle(fontSize: 32, color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsetsDirectional.only(top: 22, bottom: 16),
              child: Text(
                'Build your career with youssef',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            ),
            trailing: Icon(
              FontAwesomeIcons.trash,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 24),
            child: Text(
              'December4, 2024',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
