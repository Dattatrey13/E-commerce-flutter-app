import 'package:dapperz/models/address_list_model.dart' as alm;

import '../../config.dart';

class AddressLayout extends StatelessWidget {
  final alm.Data? addressList;
  final int? index;
  final int? selectRadio;
  final GestureTapCallback? onTap;
  bool? atDelivery = false;
  bool? isShow;

  AddressLayout(
      {Key? key,
      this.atDelivery,
      this.selectRadio,
      this.onTap,
      this.index,
      this.addressList,
      this.isShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeliveryDetailWidgets()
        .deliveryAddressLayout(
            child: AddressDetail(
              atDelivery: atDelivery,
              addressList: addressList,
              index: index,
              selectRadio: selectRadio,
              isShow: isShow,
            ),
            index: -1,
            selectRadio: selectRadio)
        .gestures(onTap: onTap);
  }
}
