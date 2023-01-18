import 'package:stacked/stacked.dart';

import '../../model/doctor.dart';

class SearchDoctorViewModel extends BaseViewModel {
  final List<Doctor> doctors;

  SearchDoctorViewModel(this.doctors);

  List<Doctor> search(String input) {
    if (input.isEmpty) {
      return [];
    }
    return doctors.where((doctor) => doctor.doctorName.toLowerCase().startsWith(input)).toList();
  }

  void initialize() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
