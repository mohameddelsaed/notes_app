import 'package:flutter/material.dart';
import 'package:note_app2/Widgets/add_note_bottom.dart';
import 'package:note_app2/Widgets/notes_view_body.dart';



class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              context: context, builder: (context) {
            return AdNote();
          });
        },
        child: const Icon(Icons.add, color: Colors.grey,),
      ),
      body: const NotesViewBody(),
    );
  }

}


