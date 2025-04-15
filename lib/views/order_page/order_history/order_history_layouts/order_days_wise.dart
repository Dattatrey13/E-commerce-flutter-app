import 'package:dapperz/common_methods.dart';
import 'package:dapperz/models/order/get_all_order_list_model.dart' as gaolm;

import '../../../../config.dart';

class OrderDaysWise extends StatelessWidget {
  final gaolm.Data? daysWiseList;
  final int? index, lastIndex;
  final bool isRatingShow;
  final GestureTapCallback? onTap;

  const OrderDaysWise(
      {Key? key,
      this.daysWiseList,
      this.lastIndex,
      this.index,
      this.onTap,
      this.isRatingShow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  LatoFontStyle(
                    text: "Order #${daysWiseList!.id}",
                    fontWeight: FontWeight.w600,
                    fontSize: FontSizes.f14,
                    color: appCtrl.appTheme.blackColor,
                  ),
                  Row(
                    children: [
                      // OrderHistoryWidget().commonText(OrderHistoryFont().size),
                      // const Space(5, 0),
                      // OrderHistoryWidget().commonText(daysWiseList!.size),
                      // const Space(10, 0),
                      OrderHistoryWidget().commonText("Total:"),
                      const Space(5, 0),
                      OrderHistoryWidget().commonText(
                          appCtrl.priceSymbol + daysWiseList!.total.toString()),
                    ],
                  ),
                  const Space(0, 5),
                  OrderHistoryWidget().viewDetailText(daysWiseList!.status, "")
                ]).marginOnly(
                    left: AppScreenUtil().screenWidth(
                        appCtrl.isRTL || appCtrl.languageVal == "ar" ? 0 : 15),
                    right: AppScreenUtil().screenWidth(
                        appCtrl.isRTL || appCtrl.languageVal == "ar" ? 15 : 0)),
              ],
            ),
            StatusLayout(title: daysWiseList!.status!.tr.toUpperCase())
          ],
        ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
        const Space(0, 20),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(imageAssets.mapSection,
                height: AppScreenUtil().screenHeight(100), fit: BoxFit.fill),
            Row(children: [
              OrderDateDeliveryStatus(
                  title: OrderHistoryFont().ordered,
                  value:
                      dateTimeForOrder(daysWiseList!.dateCreated.toString())),
              // daysWiseList!.transactionId),
              const Space(15, 0),
              OrderDateDeliveryStatus(
                  title: "Payment Mode",
                  value: daysWiseList!.paymentMethodTitle!)
            ]).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15))
          ],
        ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
        if (isRatingShow) OrderRating(onTap: onTap),
        const Space(0, 15),
        if (index != lastIndex)
          Divider(
              color: appCtrl.appTheme.borderColor,
              endIndent: 15,
              indent: 15,
              thickness: 1),
        const Space(0, 15)
      ]);
    });
  }
}
