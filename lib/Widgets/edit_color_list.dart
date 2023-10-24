import 'package:flutter/cupertino.dart';
import 'package:note_app2/Widgets/color_list_view.dart';
import 'package:note_app2/models/note_model.dart';
import 'package:note_app2/views/constence.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex ;

  @override
  void initState() {
    currentIndex = Kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35*2,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal ,
        itemCount: Kcolors.length,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
                onTap: (){
                  currentIndex=index;
                  widget.note.color= Kcolors[index].value;
                  setState(() {

                  });
                },
                child: ColorItem(
                  color: Kcolors[index],
                  isActive: currentIndex==index,)),
          );
        },
      ),
    );
  }
}