import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app2/add_note_cubit/add_note_cubit.dart';
import 'package:note_app2/models/note_model.dart';
import 'package:note_app2/notes_cubit/notes_cubit.dart';
import 'package:note_app2/simble_bloc_obsrver.dart';
import 'package:note_app2/views/Notes_View.dart';
import 'package:note_app2/views/constence.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimbleBloc();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);


  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      child: BlocProvider(
        create: (context) => NotesCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark,),
          home: const NotesView(),
        ),
      ),
    );
  }
}
