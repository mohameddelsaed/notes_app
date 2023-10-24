import 'dart:ui';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:note_app2/models/note_model.dart';
import 'package:note_app2/views/constence.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
 Color color = const Color(0xff5C1A1B);

  addNote(NoteModel note) async {
    note.color= color.value;
    emit(AddNoteLoading());
    try {
      var notesBox  = Hive.box<NoteModel>(kNotesBox);

      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
     emit( AddNoteFailure(e.toString()));
    }
  }
}
 