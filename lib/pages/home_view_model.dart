import 'package:stacked/stacked.dart';

import '../model/doctor.dart';

class HomeViewModel extends BaseViewModel {
  List<Doctor> doctors = [
    Doctor("assets/images/doctor2.png", 4.9, "Dr. Arlene McCoy", 'Therapist'),
    Doctor("assets/images/doctor1.png", 4.2, "Dr. Albert Flores", 'Surgeon'),
    Doctor("assets/images/doctor3.png", 5.0, "Dr. Sergei Suarez", 'Dentist'),
  ];

  List<List<String>> tabs = [
    ['Dentist', 'assets/icons/tooth.png'],
    ['Surgeon', 'assets/icons/surgeon.png'],
    ['Therapist', 'assets/icons/pills.png'],
  ];

  String? selectedTab;
  String? selectedDoctor;
  String? searchTerm;

  void setSelectedTab(String tabIclickedOn) {
    if (selectedTab == tabIclickedOn) {
      selectedTab = null;
    } else {
      selectedTab = tabIclickedOn;
    }
    notifyListeners();
  }

  void setSelectedDoctor(String doctorIselected) {
    if (selectedDoctor == doctorIselected) {
      selectedDoctor = null;
    } else {
      selectedDoctor = doctorIselected;
    }
    notifyListeners();
  }

  void setSearchTerm(String newSearchTerm) {
    searchTerm = newSearchTerm;
    notifyListeners();
  }

  List<Doctor> getDoctorsForTab(String? tab) {
    if (tab == null) {
      return doctors;
    }
    return doctors.where((element) => element.doctorProfession == tab).toList();
  }

  List<Doctor> getDoctorsForSearchTerm(String? searchTerm) {
    if (searchTerm == null) {
      return doctors;
    }
    return doctors.where((element) => element.doctorName.contains(searchTerm)).toList();
  }

  List<Doctor> getDoctorsForSearchTermOnTab( String? tab) {
    if (tab != null) {
      return doctors.where((element) => element.doctorProfession == tab).toList();
    } else if (searchTerm != null) {
      return doctors.where((element) => element.doctorName.contains(searchTerm!)).toList();
    } else { return doctors;
    }
  }

  ///filter doctors by rating > 4.3
  ///rating scale is the rating the user chose
  List<Doctor> getDoctorByRating(double ratingScale){
    return doctors.where((element) => element.rating > ratingScale).toList();
  }

  void showAllDoctors() {
    selectedTab = null;
    notifyListeners();
  }

  void initialize() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
