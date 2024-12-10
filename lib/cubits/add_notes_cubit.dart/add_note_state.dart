part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccessed extends AddNoteState {}

class AddNoteFailured extends AddNoteState {
  final String errorMessage;
  AddNoteFailured(this.errorMessage);
}
