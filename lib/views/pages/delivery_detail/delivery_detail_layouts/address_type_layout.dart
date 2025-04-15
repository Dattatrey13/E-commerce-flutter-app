import 'package:dapperz/common_methods.dart';

import '../../../../config.dart';

class AddressTypeLayout extends StatefulWidget {
  const AddressTypeLayout({Key? key}) : super(key: key);

  @override
  State<AddressTypeLayout> createState() => _AddressTypeLayoutState();
}

class _AddressTypeLayoutState extends State<AddressTypeLayout> {
  List addressType = [];
  int selectRadio = 0;
  bool isChecked = false;
  String value = "home";

  //state list
  var state = ["Select state", "Gujarat"];

  //country list
  var country = ["India"];

  @override
  void initState() {
    addressType = AppArray().addressType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LatoFontStyle(
          text: DeliveryDetailFont().typeOfAddress,
          fontSize: FontSizes.f16,
          fontWeight: FontWeight.w600,
        ),
        const Space(0, 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...addressType.asMap().entries.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomRadio(
                    index: e.key,
                    selectRadio: selectRadio,
                    onTap: () => selectAddressType(e.value, e.key),
                  ),
                  const Space(10, 0),
                  LatoFontStyle(
                    text: e.value['title'].toString().tr,
                    color: appCtrl.appTheme.contentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: FontSizes.f16,
                  )
                ],
              ).marginOnly(right: AppScreenUtil().screenWidth(20));
            }).toList()
          ],
        ),
        const MakeDefaultAddress()
      ],
    ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
  }

  //select address
  selectAddressType(val, index) {
    value = val['title'] ?? "Something";
    selectRadio = index;
    setState(() {});
  }
}
