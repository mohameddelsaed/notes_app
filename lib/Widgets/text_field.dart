import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const CustomTextField({super.key, required this.hint, this.MaxLines =1, this.onSaved, this.onChanged });
  final String hint;
  // ignore: non_constant_identifier_names
  final int MaxLines;
// ignore: prefer_typing_uninitialized_variables
final onSaved;
 final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged ,
      onSaved:onSaved ,
      validator: (value)
      {
        if(value?.isEmpty?? true){
          return 'Field is required';
        }else
        {
          return null;
        }
      },
      cursorColor: Colors.white,
      maxLines: MaxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey ),
        border: buildBorder(),
            enabledBorder: buildBorder(),
        focusedBorder: buildBorder(const Color(0xff33FFFF)),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide(
        color: color?? Colors.white,
      ),
      );
  }
}
