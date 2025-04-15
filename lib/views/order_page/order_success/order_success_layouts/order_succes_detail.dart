import '../../../../config.dart';

class OrderSuccessDetail extends StatelessWidget {
  final String? orderId;
  final String? orderMode;
  final String? address1;
  final String? address2;

  const OrderSuccessDetail({Key? key, this.orderId, this.orderMode, this.address1, this.address2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
            text: OrderSuccessFont().orderDetail,
            fontSize: FontSizes.f16,
            color: appCtrl.appTheme.blackColor,
            fontWeight: FontWeight.w700,
          ),
          const Space(0, 20),
          OrderSuccessWidget().commonDetailText(OrderSuccessFont().yourOrder + orderId!, OrderSuccessFont().orderInfo),
          const Space(0, 20),
          OrderSuccessWidget().commonDetailText(OrderSuccessFont().orderShipped, "${address1 ?? ""} ${address2 ?? ""}"),
          const Space(0, 20),
          OrderSuccessWidget().commonDetailText(OrderSuccessFont().paymentMethod, orderMode),
        ],
      ).width(MediaQuery.of(context).size.width).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
