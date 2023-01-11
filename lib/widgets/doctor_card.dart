import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.deepPurple[100]),
        child: Column(
          children: [
            //picture of doctor
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/doctor2.png',
                height: 100,
              ),
            ),
            //ratings out of 5
            Row(
              children:  [
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                const Text('4.9'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // dr name
            const Text(
              "Dr. Arlene Mccoy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4,),
            //occupation how many years
            Text(
              "Therapist, 7 y.e",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
