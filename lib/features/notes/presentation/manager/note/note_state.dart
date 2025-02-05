part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class AddNoteSuccess extends NoteState {}

final class NoteColor extends NoteState {}
