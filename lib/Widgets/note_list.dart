import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app2/Widgets/note_item.dart';
import 'package:note_app2/models/note_model.dart';
import 'package:note_app2/notes_cubit/notes_cubit.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
            itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  const EdgeInsets.symmetric(vertical: 6),
                  child:  NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}