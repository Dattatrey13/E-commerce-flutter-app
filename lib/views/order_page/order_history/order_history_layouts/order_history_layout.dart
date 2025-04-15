import 'dart:collection';

import '../../../../config.dart';

class OrderHistoryLayout extends StatelessWidget {
  const OrderHistoryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (orderHistoryCtrl) {
      return orderHistoryCtrl.isLoading
          ? const Center(child: CircularProgressIndicator())
          : (orderHistoryCtrl.orderHistoryList.isNotEmpty)
              ? Column(
                  children: [
                    ...orderHistoryCtrl.orderHistoryList.asMap().entries.map((e) {
                      return OrderHistoryCard(
                        index: e.key,
                        lastIndex: orderHistoryCtrl.orderHistoryList.length - 1,
                        orderHistoryModel: e.value,
                        onTap: () => orderHistoryCtrl.bottomSheetLayout(),
                      ).gestures(
                        onTap: () {
                          HashMap<String, dynamic> params = HashMap();
                          params['id'] = e.value.id.toString();
                          params['is_cancelable'] = e.value.isCancelable;
                          Get.toNamed(routeName.orderDetail, arguments: params, preventDuplicates: false);
                        },
                      );
                    }).toList(),
                  ],
                )
              : const EmptyHistory();
    });
  }
}
