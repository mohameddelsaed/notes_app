
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app2/models/note_model.dart';
import 'package:note_app2/notes_cubit/notes_cubit.dart';
import 'package:note_app2/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
 final NoteModel note ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)
        {
          return EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding:  const EdgeInsets.only(top: 14, bottom: 14),
                child: Text(note.subtitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.4),
                      fontSize: 18,
                    )),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();

                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                note.date,
                style:
                TextStyle(color: Colors.black.withOpacity(.4), fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

