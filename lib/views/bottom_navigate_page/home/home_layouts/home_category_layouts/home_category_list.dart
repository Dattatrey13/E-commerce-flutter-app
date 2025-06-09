import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config.dart';

class HomeCategoryList extends StatefulWidget {
  const HomeCategoryList({Key? key}) : super(key: key);

  @override
  State<HomeCategoryList> createState() => _HomeCategoryListState();
}

class _HomeCategoryListState extends State<HomeCategoryList> {
  Timer? timer;
  ScrollController scrollController = ScrollController();

  final double rowHeight = 120.0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 8), (_) {
      double currentPosition = scrollController.offset;
      double maxScroll = scrollController.position.maxScrollExtent;
      double newPosition = currentPosition + rowHeight;

      if (newPosition >= maxScroll) {
        newPosition = 0.0;
      }

      scrollController.animateTo(
        newPosition,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<HomeController>(builder: (homeCtrl) {
        final items = homeCtrl.homeCategoryList;
        List<Widget> rows = [];
        int index = 0;

        while (index < items.length) {

          if (index < items.length && items[index].imageUrl != null) {
            rows.add(Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
              child: SizedBox(
                height: rowHeight,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  clipBehavior: Clip.hardEdge,
                  child: HomeCategoryData(data: items[index], index: index),
                ),
              ),
            ));
            index++;
          }

          List<Widget> rowChildren = [];
          for (int i = 0; i < 2 && index < items.length; i++, index++) {
            final item = items[index];
            rowChildren.add(
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: i == 0 ? 16 : 8,
                    right: i == 1 ? 16 : 8,
                    top: 1,
                    bottom: 1,
                  ),
                  child: item.imageUrl != null
                      ? Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    clipBehavior: Clip.hardEdge,
                    child: HomeCategoryData(data: item, index: index),
                  )
                      : const SizedBox(),
                ),
              ),
            );
          }

          if (rowChildren.isNotEmpty) {
            rows.add(SizedBox(
              height: rowHeight,
              child: Row(children: rowChildren),
            ));
          }
        }

        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(children: rows),
        );
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
