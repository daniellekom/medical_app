import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalapp/widgets/category_card.dart';
import 'package:medicalapp/widgets/doctor_card.dart';
import 'package:medicalapp/widgets/searchautocomplete/search_doctor_auto_complete.dart';
import 'package:stacked/stacked.dart';

import '../model/doctor.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              backgroundColor: Colors.grey[100],
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.message),label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.notifications),label: ""),
                ],
              ),
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
                              decoration:
                                  BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(16)),
                              child: Icon(Icons.person)),
                        ],
                      ),
                    ),
                    const SizedBox(
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
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple[200], borderRadius: BorderRadius.circular(12)),
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(12)),
                      child: SearchDoctorAutoComplete(
                        doctors: viewModel.doctors,
                        onClick: (doctor) {
                          viewModel.setSearchTerm(doctor.doctorName);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // horizontal listview -> categories: dentist, surgeon etc..

                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.tabs.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              iconImagePath: viewModel.tabs[index][1],
                              buttonTabText: viewModel.tabs[index][0],
                              isSelected: viewModel.selectedTab == viewModel.tabs[index][0],
                              onTap: () {
                                viewModel.setSelectedTab(viewModel.tabs[index][0]);
                              },
                            );
                          }),
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
                          if (viewModel.selectedTab != null)
                            GestureDetector(
                              onTap: viewModel.showAllDoctors,
                              child: Text(
                                "See all Doctors",
                                style: TextStyle(color: Colors.grey[500], fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.getDoctorsForSearchTermOnTab(viewModel.selectedTab).length,
                        itemBuilder: (context, index) {
                          Doctor doctor = viewModel.getDoctorsForSearchTermOnTab(viewModel.selectedTab)[index];
                          return DoctorCard(
                            doctorImagePath: doctor.imagePath,
                            rating: doctor.rating.toString(),
                            doctorName: doctor.doctorName,
                            doctorOccupation: doctor.doctorProfession,
                            isSelected: viewModel.selectedDoctor == doctor.doctorName,
                            onTap: () {
                              viewModel.setSelectedDoctor(doctor.doctorName);
                            },
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ));
  }
}
