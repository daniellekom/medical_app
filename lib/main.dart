import 'package:flutter/material.dart';
import 'package:medicalapp/pages/home_page.dart';
import 'package:medicalapp/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}


