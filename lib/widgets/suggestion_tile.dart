import 'package:flutter/material.dart';

import '../model/doctor.dart';

class SuggestionTile extends StatelessWidget {
  const SuggestionTile({Key? key, required this.doctor}) : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: Image.asset(doctor.imagePath),
      title: Text(doctor.doctorName),
      subtitle: Text(doctor.doctorProfession),

    );
  }
}
