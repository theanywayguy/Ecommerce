import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerceui/services/auth_service.dart';
import '../Components/my_button1.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _confirmpassword = new TextEditingController();
  final void Function()? toggle;

  RegisterPage({super.key, required this.toggle});

  void register(BuildContext context) async {
    final _auth = AuthService();
    if (_password.text == _confirmpassword.text) {
      try {
        await _auth.signUpWithEmailandPassword(
            _emailController.text, _password.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        16), 
                  ),
                  title: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                       
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
                        Navigator.of(context).pop(); 
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
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      16), 
                ),
                title: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      
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
                  "Passwords don't match",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
            const SizedBox(
              height: 25,
            ),
            Text("Register Now",
                style: GoogleFonts.goldman(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                )),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextfield(
              hinttext: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextfield(
              hinttext: "Password",
              obscureText: true,
              controller: _password,
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextfield(
              hinttext: "Confirm Password",
              obscureText: true,
              controller: _confirmpassword,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton1(
              text: "Register",
              ontap: () => register(context),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?  "),
                GestureDetector(
                    onTap: toggle,
                    child: Text(
                      "Login now!",
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
