
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app2/Widgets/Search_Icon.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, required this.icon, this.onPressed});
// ignore: prefer_typing_uninitialized_variables
final title;
final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
         Text(title,style: const TextStyle(fontSize: 30,),),
         const Spacer(),
         CustomSearchIcon(icon: icon,onPressed: onPressed,),
       ],
    );
  }
}




