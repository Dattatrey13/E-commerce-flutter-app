import 'package:dapperz/views/chat/chat_screen.dart';
import 'package:dapperz/views/no_internet_connection.dart';
import 'package:dapperz/views/pages/privacy_policy.dart';
import 'package:dapperz/views/pages/product_detail/all_reviews.dart';
import 'package:dapperz/views/pages/product_detail/product_detail_layouts/all_brands.dart';
import 'package:dapperz/views/pages/product_detail/product_detail_layouts/build_your_home.dart';
import 'package:dapperz/views/pages/product_detail/product_detail_layouts/contact_us.dart';
import 'package:dapperz/views/pages/product_detail/product_detail_layouts/delete_account.dart';
import 'package:dapperz/views/pages/product_detail/product_detail_layouts/get_a_call.dart';
import 'package:dapperz/views/pages/product_detail/product_detail_layouts/get_quote.dart';
import 'package:dapperz/views/pages/product_detail/product_detail_layouts/guide.dart';
import 'package:dapperz/views/pages/refund_and_returns_policy.dart';
import 'package:dapperz/views/pages/shipping_policy.dart';
import 'package:dapperz/views/payment_page.dart';
import 'package:dapperz/views/quote/quote_detail.dart';
import 'package:dapperz/views/quote/quote_list.dart';
import 'package:dapperz/views/quote/quote_request_detail.dart';
import 'package:dapperz/views/quote/vendor_list.dart';
import 'package:get/get.dart';

//app file

import 'route_name.dart';
import 'screen_list.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.login, page: () => const LoginScreen()),
    GetPage(name: _routeName.signUp, page: () => SignUpScreen()),
    GetPage(name: _routeName.dashboard, page: () => const Dashboard()),
    GetPage(name: _routeName.innerCategory, page: () => const InnerCategory()),
    GetPage(name: _routeName.shopPage, page: () => const ShopPage()),
    GetPage(name: _routeName.search, page: () => Search()),
    GetPage(name: _routeName.productDetail, page: () => const ProductDetail()),
    GetPage(
        name: _routeName.deliveryDetail, page: () => const DeliveryDetail()),
    GetPage(name: _routeName.addAddress, page: () => const AddAddress()),
    GetPage(name: _routeName.payment, page: () => const Payment()),
    GetPage(name: _routeName.orderSuccess, page: () => const OrderSuccess()),
    GetPage(
        name: _routeName.profileSetting, page: () => const ProfileSetting()),
    GetPage(name: _routeName.orderHistory, page: () => OrderHistory()),
    GetPage(name: _routeName.orderDetail, page: () => const OrderDetail()),
    GetPage(name: _routeName.saveAddress, page: () => const SaveAddress()),
    GetPage(name: _routeName.termsCondition, page: () => TermsAndCondition()),
    GetPage(name: _routeName.help, page: () => Help()),
    GetPage(name: _routeName.aboutUs, page: () => AboutUs()),
    GetPage(name: _routeName.privacyPolicy, page: () => const PrivacyPolicy()),
    GetPage(
        name: _routeName.refundAndReturnsPolicy,
        page: () => const RefundAndReturnsPolicy()),
    GetPage(
        name: _routeName.shippingPolicy, page: () => const ShippingPolicy()),
    GetPage(
        name: _routeName.otp,
        page: () => OtpScreen(mobileNo: '', verificationId: '')),
    GetPage(name: _routeName.emptyCart, page: () => const EmptyCart()),
    GetPage(name: _routeName.emptyHistory, page: () => const EmptyHistory()),
    GetPage(name: _routeName.allReviews, page: () => AllReviews()),
    GetPage(name: _routeName.getACall, page: () => const GetACall()),
    GetPage(name: _routeName.buildYourHome, page: () => const BuildYourHome()),
    GetPage(name: _routeName.getQuote, page: () => const GetQuote()),
    GetPage(name: _routeName.contactUs, page: () => const ContactUs()),
    GetPage(name: _routeName.vendor, page: () => const VendorList()),
    GetPage(name: _routeName.quoteList, page: () => const QuoteList()),
    GetPage(name: _routeName.quoteDetail, page: () => const QuoteDetail()),
    GetPage(name: _routeName.guide, page: () => const Guide()),
    GetPage(name: _routeName.allBrands, page: () => const AllBrands()),
    GetPage(name: _routeName.paymentPage, page: () => const PaymentPage()),
    GetPage(name: _routeName.deleteAccount, page: () => const DeleteAccount()),
    GetPage(
        name: _routeName.noInternetConnection,
        page: () => const NoInternetConnection()),
    GetPage(name: _routeName.chatScreen, page: () => const ChatScreen()),
    GetPage(
        name: _routeName.quoteRequestDetail,
        page: () => const QuoteRequestDetail()),
  ];
}
