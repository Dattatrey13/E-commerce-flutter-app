import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';

class PaymentExpandableList extends StatelessWidget {
  final dynamic data;
  final int? index;

  const PaymentExpandableList({Key? key, this.index, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (index == 0)
            SizedBox(
              height: 70,
              child: Center(
                child: LatoFontStyle(
                  text: "Pay With Cash Upon Delivery",
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.blackColor,
                ),
              ),
            )
          else if (data.containsKey('child'))
            index == 1
                ? SizedBox(
                    height: 70,
                    child: Center(
                      child: LatoFontStyle(
                        text:
                            "Pay securely by Credit or Debit card or internet banking through Easebuzz",
                        fontSize: FontSizes.f14,
                        color: appCtrl.appTheme.blackColor,
                      ),
                    ),
                  )
                : Container()
        ],
      ),
    );
  }
}
