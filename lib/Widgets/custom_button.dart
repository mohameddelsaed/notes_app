import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});
  // ignore: prefer_typing_uninitialized_variables
  final onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child:  isLoading?  const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: Colors.white,)) : const Text(
          'Add',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
