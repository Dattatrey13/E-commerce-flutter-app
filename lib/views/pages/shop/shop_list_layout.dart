import 'package:dapperz/common_methods.dart';
import 'package:dapperz/widgets/infinite_widgets/progress_indicator.dart';

import '../../../config.dart';

class ShopListLayout extends StatelessWidget {
  const ShopListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 600 ? 3 : 2;
    double childAspectRatio = screenWidth > 600 ? 0.90 : 0.55;

    return GetBuilder<ShopController>(builder: (shopCtrl) {
      return shopCtrl.isLoading
          ? Center(child: ProgressIndicatorWidget())
          : shopCtrl.productList.isNotEmpty
              ? GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: shopCtrl.productList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        appCtrl.goToProductDetail(
                            slug:
                                shopCtrl.productList[index].id.toString());
                      },
                      child: DashboardProductCard(
                              data: shopCtrl.productList[index], isFit: true)
                          .paddingOnly(
                        right: AppScreenUtil().screenWidth(8),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    childAspectRatio: childAspectRatio,
                  ),
                ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15))
              : const Center(child: Text('No Product Found'));
    });
  }
}
