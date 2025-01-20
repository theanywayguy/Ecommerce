import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerceui/services/auth_service.dart';
import '../Components/my_button1.dart';
import '../Components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final void Function()? toggle;

  LoginPage({super.key, required this.toggle});

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      UserCredential userCredential = await authService.signInwithEmailPassword(
          _emailController.text, _password.text);

      Navigator.pushNamed(context, '/shopping_page');
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      16), // Rounded corners for the dialog
                ),
                title: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      // You can change this to any icon you like
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Error',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  e.toString(),
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text(
                      'OK',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
                backgroundColor: Colors.white,
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 50,
            ),
            Text("SHOPPINGZ",
                style: GoogleFonts.goldman(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                )),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextfield(
              hinttext: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            SizedBox(
              height: 10,
            ),
            MyTextfield(
              hinttext: "Password",
              obscureText: true,
              controller: _password,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton1(
              text: "Login",
              ontap: () => login(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("No account?  "),
                GestureDetector(
                    onTap: toggle,
                    child: Text(
                      "Register now!",
                      style: GoogleFonts.lexend(fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
