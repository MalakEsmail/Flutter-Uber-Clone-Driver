import 'package:driver/global_variables.dart';
import 'package:driver/screens/login_screen.dart';
import 'package:driver/screens/main_page.dart';
import 'package:driver/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  currentUser = await FirebaseAuth.instance.currentUser;
  print("************ current user ${currentUser ?? ""}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: currentUser == null ? LoginScreen() : MainPage(),
    );
  }
}
