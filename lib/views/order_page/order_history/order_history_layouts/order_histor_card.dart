import 'dart:collection';

import 'package:dapperz/models/order/get_all_order_list_model.dart' as gaolm;

import '../../../../config.dart';

class OrderHistoryCard extends StatelessWidget {
  final gaolm.Data? orderHistoryModel;
  final int? index, lastIndex;
  final GestureTapCallback? onTap;

  const OrderHistoryCard(
      {Key? key,
      this.orderHistoryModel,
      this.index,
      this.lastIndex,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () {
          HashMap<String, dynamic> params = HashMap();
          params['id'] = orderHistoryModel!.id.toString();
          params['is_cancelable'] = orderHistoryModel!.isCancelable;
          Get.toNamed(routeName.orderDetail,
              arguments: params, preventDuplicates: false);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            OrderDaysWise(
              index: index,
              lastIndex: lastIndex,
              daysWiseList: orderHistoryModel,
              onTap: onTap,
              isRatingShow: false,
            ),
          ],
        ),
      );
    });
  }
}
