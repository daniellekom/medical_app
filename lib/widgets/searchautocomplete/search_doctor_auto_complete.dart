import 'package:flutter/material.dart';
import 'package:medicalapp/widgets/searchautocomplete/search_doctor_view_model.dart';
import 'package:medicalapp/widgets/suggestion_tile.dart';
import 'package:stacked/stacked.dart';

import '../../model/doctor.dart';

class SearchDoctorAutoComplete extends StatelessWidget {
  const SearchDoctorAutoComplete({Key? key, required this.doctors, required this.onClick}) : super(key: key);

  final Function(Doctor doctor) onClick;
  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchDoctorViewModel>.reactive(
      viewModelBuilder: () => SearchDoctorViewModel(doctors),
      builder: (context, viewModel, child) => Autocomplete<Doctor>(
        onSelected: (doctor){
          onClick(doctor);
        },
        optionsBuilder: (TextEditingValue textEditingValue) {
          return viewModel.search(textEditingValue.text);
        },
        displayStringForOption: (doctor) => doctor.doctorName,
        fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) => TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
              border: InputBorder.none,
              icon: const Icon(Icons.search),
              hintText: "Search for a Doctor",
              hintStyle: TextStyle(color: Colors.grey[600])),
        ),
        optionsViewBuilder: (context, onSelected, options) => ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            final doctor = options.elementAt(index);
            return Material(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                      onTap: () => onSelected(doctor),
                      child: SuggestionTile(doctor: doctor))),
            );
          },
        ),
      ),
    );
  }
}
