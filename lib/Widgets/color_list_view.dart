import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app2/add_note_cubit/add_note_cubit.dart';
import 'package:note_app2/views/constence.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
final bool isActive;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive? CircleAvatar(
      backgroundColor: Colors.white,
      radius: 35,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: color,
      ),
    )
   : CircleAvatar(
      radius: 32,
      backgroundColor: color,
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

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
                  BlocProvider.of<AddNoteCubit>(context).color=Kcolors[index];
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