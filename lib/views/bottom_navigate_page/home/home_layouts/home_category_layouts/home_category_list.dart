import 'dart:async';

import '../../../../../config.dart';

class HomeCategoryList extends StatefulWidget {
  const HomeCategoryList({Key? key}) : super(key: key);

  @override
  State<HomeCategoryList> createState() => _HomeCategoryListState();
}

class _HomeCategoryListState extends State<HomeCategoryList> {
  Timer? timer;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 8), (_) {
      double currentPosition = scrollController.offset; // Assuming uniform item height
      double newPosition = currentPosition + (2 * 100);
      double itemHeight = scrollController.position.extentTotal;

      if (newPosition >= scrollController.position.maxScrollExtent - (2 * 100)) {
        newPosition = 0.0; // Jump to the beginning
      } else {
        newPosition = newPosition.clamp(0.0, scrollController.position.maxScrollExtent);
        if (newPosition == currentPosition && newPosition < scrollController.position.maxScrollExtent) {
          newPosition += itemHeight; // Ensure scrolling even near the end
        }
      }

      scrollController.animateTo(
        newPosition.clamp(0.0, scrollController.position.maxScrollExtent),
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.width > 600 ? 9 : 8;
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<HomeController>(builder: (homeCtrl) {
        return SizedBox(
          height: AppScreenUtil().size(size.longestSide / height),
          child: ListView.builder(
            controller: scrollController,
            itemCount: homeCtrl.homeCategoryList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return homeCtrl.homeCategoryList[index].imageUrl != null
                  ? HomeCategoryData(data: homeCtrl.homeCategoryList[index], index: index)
                  : Container();
            },
          ),
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
