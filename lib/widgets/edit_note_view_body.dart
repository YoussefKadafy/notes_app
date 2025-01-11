import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/cubits/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? subtitle, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          icon: Icons.check,
          onPressed: () {
            widget.note.subTitle = subtitle ?? widget.note.subTitle;
            widget.note.title = title ?? widget.note.title;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Your note edited successfully"),
                duration: Duration(
                    seconds: 2), // SnackBar will disappear after 2 seconds
                behavior: SnackBarBehavior
                    .floating, // Optional: Makes the SnackBar float above the bottom
              ),
            );
          },
          title: 'Edit Note',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          onChanged: (value) {
            title = value;
          },
          hint: 'title',
        ),
        CustomTextField(
          onChanged: (value) {
            subtitle = value;
          },
          hint: 'content',
          maxlines: 5,
        ),
        EditeColorListView(noteModel: widget.note)
      ],
    );
  }
}

class EditeColorListView extends StatefulWidget {
  const EditeColorListView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditeColorListView> createState() => _EditeColorListViewState();
}

class _EditeColorListViewState extends State<EditeColorListView> {
  late int currentIndex;
  List<Color> colors = kColors;
  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.noteModel.color = colors[index].value;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ColorIcon(
                colors: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
