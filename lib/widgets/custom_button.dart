import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: kPrimaryColor),
        child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 26,
                    width: 26,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : const Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 22),
                  )),
      ),
    );
  }
}
