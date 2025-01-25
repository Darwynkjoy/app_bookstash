import 'package:flutter/material.dart';
import 'package:library_app/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//https://dribbble.com/shots/21997867-Local-Library-App  app
//https://dribbble.com/shots/12048854-Daily-UI-challenge-Day-1 sign in
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bookStash',
      debugShowCheckedModeBanner: false,
      home: Loginpage(),
    );
  }
}