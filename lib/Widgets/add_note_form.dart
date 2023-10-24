import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app2/Widgets/color_list_view.dart';
import 'package:note_app2/Widgets/custom_button.dart';
import 'package:note_app2/Widgets/text_field.dart';
import 'package:note_app2/add_note_cubit/add_note_cubit.dart';
import 'package:note_app2/models/note_model.dart';


class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState>formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32,),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(height: 16,),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hint: 'Content',
            MaxLines: 5,
          ),
          const SizedBox(height: 16,),
         const ColorListView(),
          const SizedBox(height: 16,),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true :false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                     var currentDate = DateTime.now();
                     // ignore: non_constant_identifier_names
                     var FormatCurrentDate = DateFormat.yMEd().format(currentDate);
                    var noteModel = NoteModel(title: title!,
                        subtitle: subtitle!,
                        date: FormatCurrentDate ,
                        color: Colors.white10.value);

                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                },
              );
            },
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}



