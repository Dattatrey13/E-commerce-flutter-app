import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/controllers/home_product_controllers/home_controller.dart';
import 'package:dapperz/models/product/get_location_list_model.dart' as gllm;
import 'package:dapperz/routes/index.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitySelectionDialog extends StatefulWidget {
  final List<gllm.Children> cities;

  const CitySelectionDialog({super.key, required this.cities});

  @override
  CitySelectionDialogState createState() => CitySelectionDialogState();
}

class CitySelectionDialogState extends State<CitySelectionDialog> {
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Select Your City',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      'Select City to see product availability, offers and discounts.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
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
                      UserSingleton().selectedLocation =
                          filteredCities![index].locationName;
                      UserSingleton().parentId =
                          filteredCities![index].parentId.toString();
                      appCtrl.storage.write(Session.locationName,
                          UserSingleton().selectedLocation);
                      Navigator.pop(context, true);
                      if (UserSingleton().redirectProductPage ?? false) {
                        Get.toNamed(routeName.productDetail,
                            arguments: UserSingleton().productId,
                            preventDuplicates: false);
                      }
                      homeCtrl.getData();
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
      ),
    );
  }
}
