import 'package:dapperz/controllers/home_product_controllers/home_controller.dart';
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySelectionDialog extends StatefulWidget {
  final List<cm.Data> category;

  const CategorySelectionDialog({super.key, required this.category});

  @override
  CategorySelectionDialogState createState() => CategorySelectionDialogState();
}

class CategorySelectionDialogState extends State<CategorySelectionDialog> {
  final homeCtrl = Get.put(HomeController());
  List<cm.Children>? filteredCategory = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.category.forEach((element) {
      filteredCategory!.addAll(element.children ?? []);
    });

    searchController.addListener(() {
      filterCities();
    });
  }

  void filterCities() {
    List<cm.Children> results = [];
    if (searchController.text.isEmpty) {
      widget.category.forEach((element) {
        results.addAll(element.children ?? []);
      });
    } else {
      List<cm.Children> results2 = [];
      widget.category.forEach((element) {
        results2.addAll(element.children ?? []);
      });

      results = results2
          .where((category) => category.categoryName!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredCategory = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
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
                    Text('Select Your Category',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ]),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  hintText: 'Search Category',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredCategory!.length,
                physics: const ScrollPhysics(),
                itemBuilder: (context, innerIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context, filteredCategory![innerIndex]);
                      },
                      child: Text(
                          filteredCategory![innerIndex].categoryName ?? ""),
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
