import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  AddNote(NoteModel noteModel) async {
    emit(AddNoteLoading());
    var noteBox = Hive.box(kNotesBox);
    try {
      await noteBox.add(noteModel);
      emit(AddNoteSuccesse());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
