import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);
  List<NoteModel>? allNotes;
  fetchAllNotes() {
    emit(NotesLoading());
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    print('NotesLoading ${notesBox.length}');
    allNotes = notesBox.values.toList();

    emit(NotesSuccess(notes: allNotes!));
  }
}
