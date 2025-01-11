import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/cubits/add_notes_cubit.dart/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            if (state is AddNoteSuccesse) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (Navigator.canPop(context)) {
                  Navigator.of(context, rootNavigator: true).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Your note added successfully"),
                      duration: Duration(
                          seconds:
                              2), // SnackBar will disappear after 2 seconds
                      behavior: SnackBarBehavior
                          .floating, // Optional: Makes the SnackBar float above the bottom
                    ),
                  );
                }
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              });
            }
            return const SingleChildScrollView(
                child: AbsorbPointer(
                    absorbing: State is AddNoteLoading ? true : false,
                    child: AddNoteForm()));
          },
        ),
      ),
    );
  }
}
