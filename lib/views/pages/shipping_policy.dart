import 'package:dapperz/config.dart';

class ShippingPolicy extends StatefulWidget {
  const ShippingPolicy({super.key});

  @override
  State<ShippingPolicy> createState() => _ShippingPolicyState();
}

class _ShippingPolicyState extends State<ShippingPolicy> {
  final aboutUsCtrl = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(builder: (_) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: const BackArrowButton(),
            backgroundColor: aboutUsCtrl.appCtrl.appTheme.whiteColor,
            title: const LatoFontStyle(
              text: "Shipping Policy",
              fontSize: FontSizes.f15,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutUsWidget()
                    .commonDescText("- Thanks for shopping at dapperz"),
                AboutUsWidget().commonDescText(
                    "- All prices listed in dapperz are generally inclusive of shipping. If additional shipping charges are to be levied by the supplier/Manufacture/Authorized Dealer which requires additional heavy transportation services which are solely based on the size of the order, the same will be informed prior to shipment."),
                AboutUsWidget().commonDescText(
                    "- dapperz shall ensure the timely delivery of the order placed on the marketplace, however does not guarantee the exact/timely delivery of the products purchased. Since, products are directly shipped from the Supplier/Manufacturer/Authorised Dealer and dapperz."),
                AboutUsWidget().commonDescText(
                    "- Does not hold any control or responsibility on shipping."),
                AboutUsWidget().commonDescText(
                    "- Customer is solely responsible for paying the additional shipping costs if any."),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "Your shipment may contain the documents :"),
                AboutUsWidget().commonDescText(
                    "- Copy of the Order invoice (Original copy can be downloaded from your account profile and copy would be sent to your email id)"),
                AboutUsWidget().commonDescText(
                    "- Copy of the Delivery note (Quantities has to be checked on the time of delivery, Any missing quantities should be raised immediately to www.dapperz.in)"),
                AboutUsWidget().commonDescText(
                    "- User manual if any provided by the manufacturer."),
                AboutUsWidget().commonDescText(
                    "- Material Test Certificates, if any provided by the manufacturer."),
                AboutUsWidget().commonDescText(
                    "- Installation Manuals, if any provided by the manufacturer."),
                AboutUsWidget().commonDescText(
                    "- Warranty Cards, if any provided by the manufacturer."),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "- You can track the order status online on dapperz , provided that the shipment/logistics providers has the ability to provide the same information. You may contact info@dapperz.in or call us to know the status of your order."),
                AboutUsWidget().commonDescText(
                    "- dapperz reserves the right to withhold/ cancel the order without delivery without giving any reason."),
                AboutUsWidget().commonDescText(
                    "- Orders once processed and the material has be shipped by the manufacturer, cannot be returned for clarifications the customer can reach us on info@dapperz.in"),
                const Space(0, 30),
              ],
            ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          ),
        ),
      );
    });
  }
}
