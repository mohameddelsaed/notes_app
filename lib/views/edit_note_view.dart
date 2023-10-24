import 'package:flutter/material.dart';
import 'package:note_app2/Widgets/edit_view_body.dart';
import 'package:note_app2/models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
 final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
