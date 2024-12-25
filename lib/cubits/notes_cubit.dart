import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    try {
      List<NoteModel> allNotes = notesBox.values.toList();
      emit(NotesSuccess(notes: allNotes));
    } catch (e) {
      emit(NotesFailure(errorMessage: e.toString()));
    }
  }
}
