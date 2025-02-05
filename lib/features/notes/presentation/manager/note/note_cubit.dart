import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  Color? color;

  List<NoteModel> notes = [];

  fechAllNotes() {
    var notesBox = Hive.box<NoteModel>('notes_Box');
    notes = notesBox.values.toList();
    emit(AddNoteSuccess());
  }

  addNote(NoteModel note) async {
    var notesBox = Hive.box<NoteModel>('notes_Box');
    await notesBox.add(note);
    emit(AddNoteSuccess());
  }

  changingColor() {
    emit(NoteColor());
  }
}
