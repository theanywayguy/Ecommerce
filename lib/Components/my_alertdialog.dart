import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onClose;

  const ErrorAlertDialog({
    super.key,
    required this.errorMessage,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        'Error',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.redAccent,
        ),
      ),
      content: Text(
        errorMessage,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onClose,
          child: Text(
            "Close",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          color: Colors.redAccent,
        ),
      ],
    );
  }
}
