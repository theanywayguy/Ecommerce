import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton1 extends StatelessWidget {
  final String text;
  final void Function()? ontap;

  const MyButton1({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.notoSans(),
          ),
        ),
      ),
    );
  }
}
