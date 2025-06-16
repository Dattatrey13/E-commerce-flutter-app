import 'package:dapperz/config.dart';

class RefundAndReturnsPolicy extends StatefulWidget {
  const RefundAndReturnsPolicy({super.key});

  @override
  State<RefundAndReturnsPolicy> createState() => _RefundAndReturnsPolicyState();
}

class _RefundAndReturnsPolicyState extends State<RefundAndReturnsPolicy> {
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
              text: "Refund and Returns Policy",
              fontSize: FontSizes.f15,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutUsWidget().commonDescText(
                    "This Returns and Cancellation Policy sets out the terms under which The Construction Store accepts and executes returns and cancellations of orders, and shall apply to Buyers/Customer."),
                AboutUsWidget().commonDescText(
                    "The Company shall endeavor to facilitate timely delivery of Products / Materials/Services as per the Buyer’s order details. If a Buyer is not satisfied with a purchase, we are here to help."),
                const Space(0, 20),
                AboutUsWidget()
                    .commonText("Returns", FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "Returns of Products are accepted from Buyers under the following conditions:"),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "- Products can only be returned if they are in an unused condition"),
                AboutUsWidget().commonDescText(
                    "- If the size or the dimensions of the ordered Product is not as specified in the purchase order and is beyond tolerance limit (as per industry standard)."),
                AboutUsWidget()
                    .commonDescText("- If incorrect Products are delivered."),
                AboutUsWidget().commonDescText(
                    "- If a packed Product delivered is found tampered with."),
                AboutUsWidget().commonDescText(
                    "- If it is found that received Products are defective or malfunctioning."),
                AboutUsWidget().commonDescText(
                    "- If quality of the received Product does not match with the specifications stated in a purchase order"),
                AboutUsWidget().commonDescText(
                    "- All items to be returned must be unused and in their original condition with all original tags and packaging intact"),
                const Space(0, 20),
                //description2 text layout
                AboutUsWidget().commonText(
                    "Returns are NOT if,", FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                //description2 text layout
                AboutUsWidget().commonDescText(
                    "- A Product is used and/or is found to have been tampered with by a Buyer."),
                AboutUsWidget().commonDescText(
                    "- A Product is not properly installed or used as per manufacturers guidelines/industry standard which resulted in damage or malfunctioning."),
                AboutUsWidget().commonDescText(
                    "- A return is not notified within time as specified above."),
                AboutUsWidget().commonDescText(
                    "- We cannot exchange a Product for another Product."),
                AboutUsWidget().commonDescText(
                    "- Partial returns / leftovers of delivered Product are not accepted."),
                AboutUsWidget().commonDescText(
                    "- Cement, Steel, Binding Wire and other Building Material are not applicable for return."),
                const Space(0, 20),
                AboutUsWidget().commonText("Cancellation by Dapperz Mart",
                    FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "- Please note that there may be certain orders that we are unable to accept and must cancel. We reserve the right, at our sole discretion, to refuse or cancel any order for any reason. Some situations that may result in your order being canceled include limitations of quantities available for purchase, inaccuracies or errors in Product or pricing information, or problems identified by our credit and fraud avoidance department."),
                AboutUsWidget().commonDescText(
                    "- We may also require additional verifications or information before accepting any order. We will contact you if all or any portion of your order is canceled or if additional information is required to accept your order. If your order is cancelled after your credit card has been charged, the said amount will be reversed back in your Card Account. The customer agrees not to dispute the decision made by Dapperz MART and accept Dapperz MART decision regarding the cancellation."),
                const Space(0, 20),
                AboutUsWidget().commonText("Cancellations by the customer",
                    FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "- In case of requests for order cancellations, Dapperz MART reserves the right to accept or reject requests for order cancellations for any reason. As part of usual business practice, if we receive a cancellation notice and the order has not been invoiced, we shall cancel the order and refund the entire amount."),
                AboutUsWidget().commonDescText(
                    "- If you’d like to cancel your order please call customer service at +91 990 990 6954/+91 990 990 6964, MON-SUN : 09:00 – 18:00 (IST)"),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "Partial Cancellations / Modifications",
                    FontWeight.w700,
                    FontSizes.f16),
                const Space(0, 20),
                //description2 text layout
                AboutUsWidget().commonDescText(
                    "- In case a Buyer wants to partially cancel some Products from the order placed, the same needs to be notified to the customer support at The Construction Store immediately and a new order has to be generated for the modified quantities. For example, if the Buyer placed order for 100 bags of cement but wants to modify it to only 50 bags). This can be done by contacting customer care."),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "NOTE: All such modification / partial cancellations must be initiated before the Products ordered / order is processed."),
                AboutUsWidget().commonDescText(
                    "Once a Buyer cancels the order (subject to and satisfying the above mentioned conditions) online on the Website/through customer care, the entire amount paid will be refunded to the Buyer with no cancellation charges being applicable."),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "Refund Policy", FontWeight.w700, FontSizes.f18),
                const Space(0, 5),
                AboutUsWidget().commonText(
                    "Cancelled Orders", FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "If your payment method is Prepaid- Refund will reflect in 5-15 working days depending upon your bank. Dapperz Credits- refund will reflect in your registered account within 48 working hours."),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "Returned Orders", FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "Once the product(s) reaches back to our warehouse and completes the quality check, refund(s) shall be initiated as per the below, If your payment method is Prepaid- Refunds will be initiated in 48 hours and amount may take up to 5-10 working days depending upon your bank to reflect in your account. Dapperz Credits- Refunds will be initiated in 24 hours, Credits shall reflect in your registered account within 2 working days. Cash on delivery – We shall send you a link on your registered number & Email Id within 48 hours, You can claim the amount by entering your UPI Id or your Bank Account information. (Link shall be valid up to 7 days)"),
                const Space(0, 20),
                AboutUsWidget().commonText(
                    "Warranty Claim", FontWeight.w700, FontSizes.f16),
                const Space(0, 20),
                AboutUsWidget().commonDescText(
                    "Please reach our customer support at 990 990 6954/990 990 6964 MON-SUN : 09:00 – 18:00 General conditions for warranty claim Claims are entertained only against manufacturing defects and admissible when Products have been appropriately used. The warranty does not cover damage caused by improper care, misuse, accident or neglect. The warranty does not cover for products in used condition and has surpassed the warranty period."),
                const Space(0, 20),
                AboutUsWidget()
                    .commonText("Contact Us :", FontWeight.w700, FontSizes.f16),
                AboutUsWidget().commonDescText("info@dapperz.in"),
                AboutUsWidget().commonDescText("+91 990 990 6954"),
                AboutUsWidget().commonDescText("+91 990 990 6964"),
                const Space(0, 30),
              ],
            ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          ),
        ),
      );
    });
  }
}
