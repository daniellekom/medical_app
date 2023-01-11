import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorImagePath;
  final String rating;
  final String doctorName;
  final String doctorOccupation;

  const DoctorCard({
    super.key,
    required this.doctorImagePath,
    required this.rating,
    required this.doctorName,
    required this.doctorOccupation,
  });

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
                doctorImagePath,
                height: 100,
              ),
            ),
            //ratings out of 5
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                Text(rating),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // dr name
            Text(
              doctorName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 4,
            ),
            //occupation how many years
            Text(
              "${doctorOccupation} 7 y.e.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
