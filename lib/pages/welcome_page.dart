import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Column(
          children: [
            Lottie.network(
              "https://assets8.lottiefiles.com/packages/lf20_fcxpjdtz.json",
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "All specialists in one app",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Find your doctor and make an\nappointment with one tap",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return const HomePage();
              })),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100,vertical:20),
                decoration: BoxDecoration(color: Colors.deepPurple[300], borderRadius: BorderRadius.circular(20)),
                child: const Text("Get Started",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
