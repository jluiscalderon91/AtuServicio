import 'package:flutter/material.dart';
import 'package:yala_mazad/home.dart';
import 'package:yala_mazad/login.dart';
import 'package:yala_mazad/signUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASDASDSA',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Home(),
      routes: {
        '/signUp': (context) => SignUp(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/feedback': (context) => Home(),
      },
    );
  }
}