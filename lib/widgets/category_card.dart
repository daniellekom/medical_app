import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple[100],
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/tooth.png',
              height: 30,
            ),
            SizedBox(width: 20,),
            Text("Dentist"),
          ],
        ),
      ),
    );
  }
}
