import 'package:ecommerceui/Components/Shop.dart';
import 'package:ecommerceui/Pages/cart_page.dart';
import 'package:ecommerceui/Pages/login_page.dart';
import 'package:ecommerceui/Pages/register_page.dart';
import 'package:ecommerceui/Pages/setting_page.dart';
import 'package:ecommerceui/Pages/shopping_page.dart';
import 'package:ecommerceui/Theme/theme_provider.dart';
import 'package:ecommerceui/services/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/IntroPage.dart';
import 'package:ecommerceui/services/log_or_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => Shop()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/introPage': (context) => IntroPage(),
        '/shopping_page': (context) => ShoppingPage(),
        '/cart_page': (context) => CartPage(),
        '/setting_page': (context) => SettingPage(),
        '/LoginorRegister': (context) => RegisterorLogin(),
      },
    );
  }
}
