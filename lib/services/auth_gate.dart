import 'package:ecommerceui/Pages/IntroPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceui/services/log_or_register.dart';
import '../Pages/shopping_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              print(
                  "Auth state snapshot: ${snapshot.connectionState}, user: ${snapshot.data}");

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData) {
                print("User logged in: ${snapshot.data?.email}");
                return ShoppingPage();
              }

              print("User not logged in");
              return const RegisterorLogin();
            }));
  }
}
