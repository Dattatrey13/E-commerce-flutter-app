import '../../../../config.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (cartCtrl.cartModelList != null) const CartList(),
          ProductDetailWidget().commonText(text: "${CartFont().orderDetail}:", fontSize: FontSizes.f14),
          const Space(0, 20),
          if (cartCtrl.cartModelList != null && cartCtrl.cartTotalData != null)
            CartOrderDetailLayout(cartModelList: cartCtrl.cartModelList, cartTotal: cartCtrl.cartTotalData),
        ],
      );
    });
  }
}
