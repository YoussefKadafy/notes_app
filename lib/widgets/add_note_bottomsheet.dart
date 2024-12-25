import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/cubits/add_notes_cubit.dart/add_note_cubit.dart';
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
        child: BlocListener<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const SingleChildScrollView(
              child: AbsorbPointer(
                  absorbing: State is AddNoteLoading ? true : false,
                  child: AddNoteForm())),
        ),
      ),
    );
  }
}
