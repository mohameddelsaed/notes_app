import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app2/Widgets/custom_appbar.dart';
import 'package:note_app2/Widgets/edit_color_list.dart';
import 'package:note_app2/Widgets/text_field.dart';
import 'package:note_app2/models/note_model.dart';
import 'package:note_app2/notes_cubit/notes_cubit.dart';


class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

  String  ? title,content;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 60,),
          CustomAppBar(
            onPressed: (){
              widget.note.title = title?? widget.note.title;
              widget.note.subtitle = content?? widget.note.subtitle;
              widget.note.save();
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            },

            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(height: 50,),
          CustomTextField(
            onChanged:  (value){ title = value; } ,
              hint: widget.note.title),
          const SizedBox(height: 18),
          CustomTextField(
            onChanged: (value){
              content = value;
            },
              MaxLines: 5,
              hint: widget.note.subtitle),
          const SizedBox(height: 18,),
          EditNoteColorList(note: widget.note,),
        ],
      ),
    );
  }
}








