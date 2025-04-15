import 'package:dapperz/config.dart';
import 'package:dapperz/models/product/product_detail_model.dart' as pm;

class ProductSizeLayout extends StatelessWidget {
  final pm.AttributeMapping product;
  final int index;

  const ProductSizeLayout(
      {Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductDetailWidget()
                  .commonText(text: "Select ${product.name}", fontSize: 14),
              // ProductDetailWidget().sizeChart(ProductDetailFont().sizeChart),
            ],
          ),
          if (product.options!.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...product.options!.asMap().entries.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizeCard(
                          sizeModel: e.value,
                          index: e.key,
                          selectSize: productCtrl.selectedIndex[index],
                          onTap: () {
                            bool condition = true;
                            productCtrl.selectedIndex[index] = e.key;
                            for (var element in productCtrl.selectedIndex) {
                              if (element == -1) {
                                condition = false;
                              }
                            }
                            if (index == (productCtrl.attributes.length - 1) ||
                                productCtrl.attributes.length == 1 ||
                                condition) {
                              productCtrl.setVariable(e.value);
                            }
                            productCtrl.update();
                          }),
                    );
                  })
                ],
              ),
            ).marginOnly(
                left: AppScreenUtil().screenWidth(15),
                top: AppScreenUtil().screenHeight(15))
        ],
      );
    });
  }
}
