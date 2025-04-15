import 'package:dapperz/controllers/home_product_controllers/home_controller.dart';
import 'package:dapperz/models/product/get_location_list_model.dart' as gllm;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormCitySelectionDialog extends StatefulWidget {
  final List<gllm.Children> cities;

  const FormCitySelectionDialog({super.key, required this.cities});

  @override
  FormCitySelectionDialogState createState() => FormCitySelectionDialogState();
}

class FormCitySelectionDialogState extends State<FormCitySelectionDialog> {
  final homeCtrl = Get.put(HomeController());
  List<gllm.Children>? filteredCities;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCities = widget.cities;
    searchController.addListener(() {
      filterCities();
    });
  }

  void filterCities() {
    List<gllm.Children> results = [];
    if (searchController.text.isEmpty) {
      results = widget.cities;
    } else {
      results = widget.cities
          .where((city) => city.locationName!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredCities = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: const Text('Select Your City',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                hintText: 'Search City',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: filteredCities?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, filteredCities![index].locationName);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Text(filteredCities![index].locationName ?? ""),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
