import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/views/pages/add_address/add_address.dart';
import 'package:dapperz/widgets/common/address_layout.dart';

class SaveAddress extends StatefulWidget {
  const SaveAddress({Key? key}) : super(key: key);

  @override
  State<SaveAddress> createState() => _SaveAddressState();
}

class _SaveAddressState extends State<SaveAddress> {
  final addressCtrl = Get.put(SaveAddressController());

  String value = "address";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaveAddressController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: const BackArrowButton(),
          backgroundColor: appCtrl.appTheme.whiteColor,
          title: LatoFontStyle(
            text: CommonTextFont().savedAddress,
            color: appCtrl.appTheme.blackColor,
          ),
        ),
        body: SingleChildScrollView(
          child: appCtrl.isShimmer || addressCtrl.isLoading
              ? const AddressListShimmer()
              : Column(
                  children: [
                    // address list layout
                    if (addressCtrl.deliveryDetail != null)
                      ...addressCtrl.deliveryDetail!.data!
                          .asMap()
                          .entries
                          .map((e) {
                        return AddressLayout(
                          selectRadio: addressCtrl.deliveryDetail!.data![e.key]
                                      .isDefault! ==
                                  true
                              ? e.key
                              : null,
                          index: e.key,
                          addressList: e.value,
                          isShow: true,
                        ).marginSymmetric(
                            horizontal: AppScreenUtil().screenWidth(15));
                      }).toList(),
                    // add new address button layout
                    CustomButton(
                      onTap: () async {
                        var status = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddAddress(),
                          ),
                        );
                        if (status != null && status) {
                          appCtrl.update();
                          addressCtrl.getAddress();
                          Get.forceAppUpdate();
                        }
                      },
                      title: DeliveryDetailFont().addNewAddress,
                      border: Border.all(color: appCtrl.appTheme.primary),
                      fontWeight: FontWeight.normal,
                      fontSize: FontSizes.f16,
                      //color: appCtrl.appTheme.whiteColor,
                      fontColor: Colors.black,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
        ),
      );
    });
  }
}
