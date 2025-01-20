import 'package:flutter/material.dart';

import '../Pages/login_page.dart';
import '../Pages/register_page.dart';

class RegisterorLogin extends StatefulWidget {
  const RegisterorLogin({super.key});

  @override
  State<RegisterorLogin> createState() => _RegisterorLoginState();
}

class _RegisterorLoginState extends State<RegisterorLogin> {
  bool showLoginPage = true;

  void togglepage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        toggle: togglepage,
      );
    } else {
      return RegisterPage(
        toggle: togglepage,
      );
    }
  }
}
