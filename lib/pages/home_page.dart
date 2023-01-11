import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalapp/widgets/category_card.dart';
import 'package:medicalapp/widgets/doctor_card.dart';

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
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Hello,", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 8),
                      Text(
                        "Dani Kay",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),

                  //profile pic
                  Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(16)),
                      child: Icon(Icons.person)),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            // card -> how do u feel?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.pink[100], borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    //animation or cute pic
                    Container(
                      height: 100,
                      width: 100,
                      child: Lottie.network("https://assets8.lottiefiles.com/packages/lf20_fcxpjdtz.json"),
                    ),
                    const SizedBox(
                      width: 25,
                    ),

                    // how do u feel + button
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "How do you feel?",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Fill out your medical card right now",
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration:
                                BoxDecoration(color: Colors.deepPurple[200], borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                              child: Text(
                                "Get Started",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: const Icon(Icons.search),
                      hintText: "How can we help you?",
                      hintStyle: TextStyle(color: Colors.grey[600])),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // horizontal listview -> categories: dentist, surgeon etc..
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(
                    iconImagePath: 'assets/icons/tooth.png',
                    categoryName: 'Dentist',
                  ),
                  CategoryCard(
                    iconImagePath: 'assets/icons/surgeon.png',
                    categoryName: 'Surgeon',
                  ),
                  CategoryCard(
                    iconImagePath: 'assets/icons/pills.png',
                    categoryName: 'Pharmacist',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //doctor list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Doctor list",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.grey[500], fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:  const [
                  DoctorCard(doctorImagePath: 'assets/images/doctor2.png', rating: '4.9', doctorName: 'Dr. Arlene McCoy', doctorOccupation: 'Therapist',),
                  DoctorCard(doctorImagePath: 'assets/images/doctor1.png', rating: '4.2', doctorName: 'Dr. Albert Flores', doctorOccupation: 'Surgeon',),
                  DoctorCard(doctorImagePath: 'assets/images/doctor3.png', rating: '5.0', doctorName: 'Dr. Sergei Suarez', doctorOccupation: 'Dentist',),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
