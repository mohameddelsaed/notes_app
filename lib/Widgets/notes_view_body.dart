import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app2/Widgets/custom_appbar.dart';
import 'package:note_app2/Widgets/note_list.dart';
import 'package:note_app2/notes_cubit/notes_cubit.dart';



class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
           Expanded(child: NotesListView()),

        ],
      ),
    );
  }
}



