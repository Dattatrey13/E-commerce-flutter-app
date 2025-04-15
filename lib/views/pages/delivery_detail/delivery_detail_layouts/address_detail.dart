import 'dart:collection';

import 'package:dapperz/models/address_list_model.dart' as alm;
import 'package:dapperz/views/pages/add_address/add_address.dart';

import '../../../../config.dart';

class AddressDetail extends StatefulWidget {
  final alm.Data? addressList;
  final int? index;
  final int? selectRadio;
  final bool? isShow;
  final bool? atDelivery;

  const AddressDetail(
      {Key? key,
      this.selectRadio,
      this.atDelivery = false,
      this.index,
      this.addressList,
      this.isShow})
      : super(key: key);

  @override
  State<AddressDetail> createState() => _AddressDetailState();
}

class _AddressDetailState extends State<AddressDetail> {
  final addressCtrl = Get.put(SaveAddressController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LatoFontStyle(
                  text:
                      "${widget.addressList?.firstName} ${widget.addressList?.lastName}",
                  fontWeight: FontWeight.w600,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.blackColor,
                ),
                Visibility(
                  visible: widget.index! == widget.selectRadio,
                  child: GestureDetector(
                    onTap: () {},
                    child: ActionButton(
                      index: widget.index,
                      selectRadio: widget.selectRadio,
                      text: CommonTextFont().defaultAdd.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
            const Space(0, 5),
            DeliveryDetailWidgets()
                .addressCommonText(widget.addressList?.address1 ?? ""),
            DeliveryDetailWidgets().addressCommonText(
                (widget.addressList?.address2 ?? "") +
                    "-" +
                    (widget.addressList?.pincode ?? "")),
            Row(
              children: [
                DeliveryDetailWidgets()
                    .addressCommonText(widget.addressList?.city ?? ""),
                const SizedBox(width: 10),
                LatoFontStyle(
                  text: widget.addressList?.state.toString().tr,
                  fontWeight: FontWeight.normal,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.contentColor,
                ),
                const SizedBox(width: 10),
                LatoFontStyle(
                  text: widget.addressList?.country ?? "",
                  fontWeight: FontWeight.normal,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.contentColor,
                )
              ],
            ),
            const Space(0, 10),
            Visibility(
              visible: widget.addressList!.phoneNumber != null,
              child: Column(
                children: [
                  Row(
                    children: [
                      DeliveryDetailWidgets()
                          .phoneCommonText(DeliveryDetailFont().phoneNo),
                      const SizedBox(width: 10),
                      DeliveryDetailWidgets().phoneCommonText(
                          widget.addressList?.phoneNumber ?? "")
                    ],
                  ),
                  const Space(0, 10),
                ],
              ),
            ),
            Visibility(
              visible: widget.isShow ?? false,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => addressCtrl
                        .deleteAddress(widget.addressList!.id!.toString()),
                    child: ActionButton(
                      index: widget.index,
                      selectRadio: widget.selectRadio,
                      text: CommonTextFont().remove.toUpperCase(),
                    ),
                  ),
                  const Space(10, 0),
                  GestureDetector(
                    onTap: () async {
                      var status = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAddress(
                              addressData: widget.addressList, isEdit: true),
                        ),
                      );
                      if (status != null && status) {
                        appCtrl.update();
                        addressCtrl.getAddress();
                        Get.forceAppUpdate();
                      }
                    },
                    child: ActionButton(
                      index: widget.index,
                      selectRadio: widget.selectRadio,
                      text: CommonTextFont().edit.toUpperCase(),
                    ),
                  ),
                  const Space(10, 0),
                  Visibility(
                    visible: !(widget.atDelivery ?? false) &&
                        (widget.index! != widget.selectRadio),
                    child: GestureDetector(
                      //TODO: update true on is default
                      onTap: () {
                        HashMap<String, dynamic> params = HashMap();
                        params['is_default'] = true;
                        addressCtrl.defaultAddress(
                            widget.addressList!.id!.toString(), params);
                      },
                      child: ActionButton(
                        index: widget.index,
                        selectRadio: widget.selectRadio,
                        text: CommonTextFont().setDefaultAdd.toUpperCase(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
