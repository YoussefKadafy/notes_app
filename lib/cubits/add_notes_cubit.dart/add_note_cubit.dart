import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/cubits/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = Color(0xffFFB627);

  Future<void> addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    emit(AddNoteLoading());
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    try {
      await noteBox.add(noteModel);
      print('Note added successfully');

      emit(AddNoteSuccesse());
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
      emit(AddNoteFailure(e.toString()));
    }
  }
}
