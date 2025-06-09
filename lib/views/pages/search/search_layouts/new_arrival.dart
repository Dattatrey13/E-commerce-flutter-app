// import '../../../../config.dart';
//
// class NewArrivalGridLayout extends StatelessWidget {
//   const NewArrivalGridLayout({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (homeCtrl) {
//       // Limit to 10 items just in case the controller has more
//       final productList = homeCtrl.newArrivalProductList.length > 10
//           ? homeCtrl.newArrivalProductList.sublist(0, 10)
//           : homeCtrl.newArrivalProductList;
//
//       return productList.isNotEmpty
//           ? GridView.builder(
//         padding: EdgeInsets.zero,
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: productList.length,
//         itemBuilder: (context, index) {
//           return GridviewThreeLayout(
//             data: productList[index],
//             index: index,
//             selectIndex: homeCtrl.selectNewArrival,
//             onTap: () {
//               homeCtrl.selectNewArrival = index;
//               homeCtrl.update();
//             },
//           );
//         },
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 0,
//           childAspectRatio: MediaQuery.of(context).size.width /
//               (MediaQuery.of(context).size.height / 4.5),
//         ),
//       )
//           : const SizedBox(
//         height: 80,
//         child: Center(child: Text('No New Arrivals')),
//       );
//     });
//   }
// }

import '../../../../config.dart';

class NewArrivalGridLayout extends StatelessWidget {
  const NewArrivalGridLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(builder: (searchCtrl) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: searchCtrl.newArrivalProductList.length,
        itemBuilder: (context, index) {
          return GridviewThreeLayout(
            data: searchCtrl.newArrivalProductList[index],
            index: index,
            selectIndex: searchCtrl.selectRecommended,
            onTap: () {
              searchCtrl.selectRecommended = index;
              searchCtrl.update();
            },
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / (4.5)),
        ),
      );
    });
  }
}
