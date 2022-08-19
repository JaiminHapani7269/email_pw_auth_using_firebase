import 'package:auth_demo/screen/auth/login_screen.dart';
import 'package:auth_demo/screen/auth/registration_screen.dart';
import 'package:auth_demo/screen/home_screem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Auth Demo",
      home: LoginScreen(),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginScreen(),
        "/regi": (context) => RegistrationScreen(),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}
