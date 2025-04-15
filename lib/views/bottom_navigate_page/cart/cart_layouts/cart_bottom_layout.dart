import '../../../../config.dart';

class CartBottomLayout extends StatelessWidget {
  final String? totalAmount, buttonName, desc;
  final bool isPrimaryDesc;
  final GestureTapCallback? onTap;

  const CartBottomLayout({Key? key, this.totalAmount, this.buttonName, this.desc, this.isPrimaryDesc = true, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        width: size.width,
        padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(size.width > 400 ? 10 : 5),
          horizontal: AppScreenUtil().screenWidth(15),
        ),
        decoration: BoxDecoration(
          color: appCtrl.appTheme.whiteColor,
          boxShadow: [
            BoxShadow(
              color: appCtrl.appTheme.lightGray,
              spreadRadius: 10,
              blurRadius: 5,
              offset: const Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: size.longestSide / 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const LatoFontStyle(text: "Cart Total ", fontSize: FontSizes.f10, textAlign: TextAlign.start, color: Colors.black),
                      LatoFontStyle(text: "${appCtrl.priceSymbol} $totalAmount", fontSize: FontSizes.f14, textAlign: TextAlign.center),
                    ],
                  ),
                  const LatoFontStyle(text: "(It includes CGST and SGST)", fontSize: FontSizes.f8, textAlign: TextAlign.center),
                ],
              ),
            ),
            CustomButton(
              title: buttonName!,
              height: size.longestSide / 25,
              fontSize: FontSizes.f10,
              onTap: onTap,
              margin: 0,
            )
          ],
        ),
      );
    });
  }
}
