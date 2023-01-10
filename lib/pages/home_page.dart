import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(children:  [
          //app bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(children: const [
            Text  ("Hello,"),
          ],),
        ),

          // card -> how do u feel?


          // search bar

          // horizontal listview -> categories: dentist, surgeon etc..

          // doctor list
        ],),
      ),
    );
  }
}
