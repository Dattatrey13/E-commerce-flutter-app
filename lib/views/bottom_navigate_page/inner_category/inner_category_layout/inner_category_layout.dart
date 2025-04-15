import '../../../../config.dart';

class InnerCategoryLayout extends StatelessWidget {
  const InnerCategoryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InnerCategoryController>(builder: (innerCtrl) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              var data = {'name': innerCtrl.innerCategoryList[index].categoryName, 'cat_id': innerCtrl.innerCategoryList[index].id};
              Get.toNamed(routeName.shopPage, arguments: data);
            },
            child: ExpandableListView(
              onPressed: () {
                var data = {'name': innerCtrl.innerCategoryList[index].categoryName, 'cat_id': innerCtrl.innerCategoryList[index].id};
                Get.toNamed(routeName.shopPage, arguments: data);
              },
              index: index,
              childLength: 0,
              title: innerCtrl.innerCategoryList[index].categoryName ?? "",
              isExpanded: false,
              child: Container(),
            ),
          );
        },
        itemCount: innerCtrl.innerCategoryList.length,
      );
    });
  }
}
