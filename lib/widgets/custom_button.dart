import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: kPrimaryColor),
      child: Center(
          child: Text(
        'Add',
        style:
            TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 22),
      )),
    );
  }
}
