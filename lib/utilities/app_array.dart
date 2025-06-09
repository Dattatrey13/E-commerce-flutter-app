import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;
import 'package:dapperz/models/onboarding_model.dart';
import 'package:dapperz/models/home_banner_model.dart';
import 'package:dapperz/models/cartlist_model.dart';
import 'package:dapperz/models/home_find_style_category.dart';

class AppArray {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  var onBoardingList = <OnBoardingModel>[
    OnBoardingModel(
        title: 'Welcome to dapperz'.tr,
        image: imageAssets.onBoarding1,
        description: "onBoard1".tr),
    OnBoardingModel(
        title: 'Perfect App for Everyone'.tr,
        image: imageAssets.onBoarding2,
        description: "onBoard2".tr),
  ];

  var homeCategory = [];
  var featuredProductList = [];

  // Slider List
  var homeSliderList = [
    {
      'text': 'Bracelet',
      'cat_id': '930',
      'image_asset': 'assets/image/1.png',
    },
    {
      'text': 'Pendant',
      'cat_id': '773',
      'image_asset': 'assets/image/2.png',
    },
    {
      'text': 'Kada',
      'cat_id': '638',
      'image_asset': 'assets/image/dapperz.png',
    },
    {
      'text': 'Key Chain',
      'cat_id': '202',
      'image_asset': 'assets/image/mobile5.png',
    },
  ];

  // Brand List
  var homeBrandList = [];

  // Recommended List
  var recommendedList = [];

  var newArrivalProductList = [];

  var keyChainList = [];

  // On Sale List
  var onSaleList = [];

  // On Sale List
  var recentlyViewedList = [];

  var orderTrack = [
    {
      "title": "Out For Delivery".tr,
      "date": "expected delivery on monday".tr,
      "isCompete": false,
    },
    {
      "title": "In Transit".tr,
      "date": "10.00 am, 21/05/2020".tr,
      "isCompete": true,
    },
    {
      "title": "Ready To Ship".tr,
      "date": "10.00 am, 21/05/2020".tr,
      "isCompete": true,
    },
    {
      "title": "Ordered".tr,
      "date": "20/05/2020".tr,
      "isCompete": true,
    }
  ];

  var bottomSheet = [
    {
      'title': 'home',
      'selectedIcon': Icons.home_filled,
      'unSelectedIcon': Icons.home
    },
    {
      'title': 'category',
      'selectedIcon': Icons.category,
      'unSelectedIcon': Icons.category_outlined
    },
    {
      'title': 'cart',
      'selectedIcon': Icons.shopping_cart_checkout,
      'unSelectedIcon': Icons.shopping_cart_checkout_outlined
    },
    {
      'title': 'wishlist',
      'selectedIcon': Icons.favorite_border,
      'unSelectedIcon': Icons.favorite_border_outlined
    },
    {
      'title': 'profile',
      'selectedIcon': Icons.account_circle,
      'unSelectedIcon': Icons.account_circle_outlined
    }
  ];

  //home banner list
  var homeBanner = <HomeBannerModel>[];

  //home find style category list
  var homeFindStyleCategory = [
    {
      'id': 1,
      'title': 'Trending Now'.tr,
    },
    {
      'id': 2,
      'title': 'Top Picks'.tr,
    },
    {
      'id': 3,
      'title': 'Featured Products'.tr,
    },
    {
      'id': 4,
      'title': 'Top Rated'.tr,
    },
    {
      'id': 5,
      'title': 'Ready To Ship'.tr,
    },
  ];

  //home Deal Of the Day list
  var homeDealOfTheDayList = <HomeDealOfTheDayModel>[];

  var drawerList = [
    {
      'title': 'home'.tr,
      'icon': Icons.home,
      'subTitle': 'Offers, Top Deals, Top Brands'.tr
    },
    // {'title': 'Brands'.tr, 'icon': Icons.category, 'subTitle': 'Cement, Steel, Chemical'.tr},
    {
      'title': 'Orders'.tr,
      'icon': Icons.notes,
      'subTitle': 'Ongoing Orders, Recent Orders..'.tr
    },
    {
      'title': 'Your Wishlist'.tr,
      'icon': Icons.favorite_border_outlined,
      'subTitle': 'Your Save Products'.tr
    },
    {
      'title': 'Your Account'.tr,
      'icon': Icons.account_circle,
      'subTitle': 'Profile, Settings...'.tr
    },
    {
      'title': 'Build Your Home',
      'icon': Icons.build,
      'subTitle': 'Transforming Dream into Reality..'.tr
    },
    {'title': 'Guide'.tr, 'icon': Icons.menu_book, 'subTitle': 'Videos..'.tr},
    {
      'title': 'Get Quote'.tr,
      'icon': Icons.request_quote,
      'subTitle': 'Get Your Custom Quote'.tr
    },
    {
      'title': 'Quotes',
      'icon': Icons.receipt_long,
      'subTitle': 'List of quote'
    },
    {
      'title': 'Message',
      'icon': Icons.message,
      'subTitle': 'Contact with Vendor'
    },
    {
      'title': 'Talk to Us',
      'icon': Icons.support_agent,
      'subTitle': 'Contact with Customer Support'
    },
    {
      'title': 'Contact Us'.tr,
      'icon': Icons.call,
      'subTitle': 'Phone Number, Emails, Location...'.tr
    },
  ];

  var guestDrawerList = [
    {
      'title': 'home'.tr,
      'icon': Icons.home,
      'subTitle': 'Offers, Top Deals, Top Brands'.tr
    },
    // {'title': 'Brands'.tr, 'icon': Icons.category, 'subTitle': 'Cement, Steel, Chemical'.tr},
    {
      'title': 'Your Wishlist'.tr,
      'icon': Icons.favorite_border_outlined,
      'subTitle': 'Your Save Products'.tr
    },
    {
      'title': 'Build Your Home',
      'icon': Icons.build,
      'subTitle': 'Transforming Dream into Reality..'.tr
    },
    {'title': 'Guide'.tr, 'icon': Icons.menu_book, 'subTitle': 'Videos..'.tr},
    {
      'title': 'Get Quote'.tr,
      'icon': Icons.request_quote,
      'subTitle': 'Get Your Custom Quote'.tr
    },
    {
      'title': 'Contact Us'.tr,
      'icon': Icons.call,
      'subTitle': 'Phone Number, Emails, Location...'.tr
    },
  ];

  //home find style category list
  var homeFindStyleCategoryList = <HomeFindStyleCategoryModel>[];

  //inner category biggest deal brand
  var innerCategoryBrandList = [];

  //offer corner
  var offerCornerList = [];

  //similar product list
  var similarProductList = <HomeFindStyleCategoryModel>[];

  //category list
  List<cm.Data> categoryList = [];

  //inner category
  var innerCategoryList = [];

  //inner category list
  var innerCategoryProduct = [];

  //home shop page list
  var homeShopPageList = <HomeFindStyleCategoryModel>[];

  //brand filter list
  var brandFilterList = [];

  //occasion filter list
  var occasionFilterList = [];

  //color list
  var colorList = [
    {'color': const Color(0xFFE6E6FA)},
    {'color': const Color(0xFFF3F3F3)},
    {'color': const Color(0xFFB0C4DE)},
    {'color': const Color(0xFFEBACA2)},
    {'color': const Color(0xFFFFC0CB)},
    {'color': const Color(0xFFADD8E6)},
    {'color': const Color(0xFFBED3C3)},
    {'color': const Color(0xFF9FD9F2)},
    {'color': const Color(0xFFF5DEB3)},
    {'color': const Color(0xFFFFE4E1)},
    {'color': const Color(0xFFE6E6FA)}
  ];

  //address type
  var addressType = [
    {"title": "Billing"},
    {"title": "Shipping"},
  ];

  //var offer & promotion list
  var offerAndPromotionList = [
    {"title": "offer1".tr},
    {"title": "offer2".tr},
    {"title": "offer1".tr},
    {"title": "offer2".tr},
  ];

  //payment method list
  var paymentMethodList = [
    {
      "title": "Cash On Delivery".tr,
      "image": iconAssets.cash,
      "method": "cod",
      "description": "Pay when you receive your order".tr,
      "isSelected": false
    },
    {
      "title": "Pay with Razorpay".tr,
      "image": iconAssets.card,
      "method": "razorpay",
      "description": "Pay securely using Credit/Debit cards, UPI, Net Banking, or Wallets".tr,
      "isSelected": false,
      "paymentOptions": [
        {
          "title": "Credit/Debit Cards".tr,
          "description": "Pay using Visa, Mastercard, RuPay, and more".tr
        },
        {
          "title": "UPI".tr,
          "description": "Pay using Google Pay, PhonePe, Paytm, and more".tr
        },
        {
          "title": "Net Banking".tr,
          "description": "Pay using your bank account".tr
        },
        {
          "title": "Wallets".tr,
          "description": "Pay using Paytm, Amazon Pay, and more".tr
        }
      ]
    }
  ];

  //card list
  var cardList = [];

  //notification category
  var notificationCategory = [];

  var helpList = [
    {
      "title": "What is dapperz.in ?",
      "child":
          "dapperz is is an e-commerce website that serves as a platform for construction materials and other services. If you wants to buy Best building material at low-cost then dapperz.in is that place."
    },
    {
      "title": "What types of building materials do you offer ?",
      "child":
          "dapperz provides a comprehensive range of building materials like Cement, Steel, Color, Plumbing Material, Electrical Material, Furniture and many more."
    },
    {
      "title": "How can i place an order on your website ?",
      "child": "Placing an order on dapperz is easy. Follow these steps:\n\n1. Explore our website and browse through our products\n2. When you find items you want to purchase, click the 'Add to Cart' button\n3. You can continue shopping or proceed to checkout\n4. Click on the 'Checkout' button\n5. You'll be prompted to provide your billing and shipping information\n6. If you have a promotional code or coupon, enter it in the designated field during checkout\n7. Select your preferred payment method – whether it's Cash on Delivery or online payment using Credit/Debit cards or Internet banking\n8. After reviewing your order details, click 'Place Order' to confirm your purchase\n9. You will receive an order confirmation\n\nCongratulations! You've successfully placed an order on dapperz."
    },
  {
      "title": "What payment methods do you accept ?",
      "child":
          "dapperz offers two convenient payment methods: 1) Cash on Delivery (COD) - Pay when you receive your order. 2) Online Payment through Razorpay - Pay securely using Credit/Debit cards, UPI, Net Banking, or Wallets. All online payments are processed through Razorpay, ensuring a safe and secure transaction."
    },
    {
      "title": "Do you provide bulk or wholesale pricing ?",
      "child":
          "Yes, dapperz provides bulk and wholesale pricing options. If you are looking to make a large purchase for your construction or building needs, please contact our team through Get Quote section and receive personalized assistance."
    },
    {
      "title": "What shipping options are available ?",
      "child":
          "We offer Free Shipping (with condition). Please check Shipping Policy for more details on eligibility and conditions for free shipping."
    },
    {
      "title": "Can i track my order ?",
      "child": "Absolutely! To track your order, simply navigate to the 'My Account' section and select 'Orders'. There, you'll find the tracking information for your order."
    },
    {
      "title": "What is your return policy ?",
      "child": "Yes, dapperz does accept returns of products in accordance with our terms and conditions. For detailed information, please refer to our Refund and Return Policy page."
          "Yes, dapperz does accept returns of products in accordance with our terms and conditions. For detailed information, please refer to our Refund and Return Policy page."
    },
    {
      "title": "Are the prices on your website inclusive of taxes ?",
      "child":
          "Yes, the prices displayed on our website already include applicable taxes. You can be confident that the amount you see at checkout is the final, all-inclusive price for your selected products. No hidden fees or additional taxes will be added later in the process."
    },
    {
      "title": "How do i contact customer support ?",
      "child":
          "Contacting our customer support is easy. You can reach us through the following methods: Email : Send an email to info@dapperz.in with your inquiries, and our support team will get back to you promptly. Phone : Feel free to call our dedicated  customer support helpline at [+91 990 990 6954 , +91 990 990 6964 ]. Our team is ready to assist you during business hours. Contact Form : Fill out the contact form in the Contact Us section. Make sure to provide detailed information so that we can better assist you."
    },
    {
      "title": "Can i modify or cancel my order after placing it ?",
      "child":
          "While modifications are not possible after placing an order, you can request cancellation. If you need to cancel your order, navigate to 'My Account' and select 'Orders'. In the Orders section, select 'Cancel Request'. Keep in mind that once an order has been processed, modifications are not feasible. However, our support team will guide you through the cancellation process."
    },
    {
      "title": "What if a product is out of stock ?",
      "child":
          "We will notify you promptly of the stock shortage. We will suggest alternative or similar products that you may be interested in. We will provide you with an estimated restocking date as soon as it becomes available. Also you can still proceed with your order. We'll fulfill it as soon as the product is back in stock."
    },
    {
      "title": "What do i do if i receive damaged or defective products ?",
      "child":
          "For damaged or defective products do following steps: Return the product for a refund or replacement. Contact Customer Support and provide details of the issue for assistance. Include photos of the damaged product to expedite the resolution process."
    },
    {
      "title": "How do i apply promotional codes or coupons during checkout ?",
      "child": "Applying promotional codes or coupons is an easy process. Follow these steps:\n\n1. Navigate to the 'Get Coupon Code' section on either the Cart Page or Checkout Page\n2. Browse through available coupon codes and their details\n3. Select the coupon that best suits your purchase\n4. Click the 'Copy Coupon Code' button to copy the code\n5. Go to the 'Apply Coupon Code' section during checkout\n6. Paste the copied code into the designated field\n7. The system will verify if the coupon conditions match your purchase\n8. If conditions are met, the discount will be applied automatically\n\nEnjoy your savings at dapperz!"
    }
  ];

  //language list
  var languageList = [
    // {'icon': imageAssets.us, 'name': 'English'.tr, 'locale': const Locale('en', 'US')},
    // // {'icon': imageAssets.ar, 'name': 'Arabic'.tr, 'locale': const Locale('ar', 'AE')},
    // {'icon': imageAssets.inImage, 'name': 'Hindi'.tr, 'locale': const Locale('hi', 'IN')},
    // // {'icon': imageAssets.kr, 'name': 'Korean'.tr, 'locale': const Locale('ko', 'KR')}
  ];

  var currencyList = [
    {
      'icon': svgAssets.inr,
      'title': 'Indian rupee'.tr,
      'code': 'INR',
      'symbol': '₹',
      'KPW': 16.50,
      'USD': 0.013,
      'AUD': 0.018,
      'EUR': 0.012,
      'INR': 1
    },
    {
      'icon': svgAssets.usd,
      'title': 'United States dollar'.tr,
      'code': 'USD',
      'symbol': '\$',
      'KPW': 1311.35,
      'USD': 1,
      'AUD': 1.44,
      'EUR': 0.98,
      'INR': 79.46
    },
    {
      'icon': svgAssets.eur,
      'title': 'Euro'.tr,
      'code': 'EUR',
      'symbol': '€',
      'KPW': 1334.87,
      'USD': 1.02,
      'AUD': 1.47,
      'EUR': 1,
      'INR': 80.63
    },
    {
      'icon': svgAssets.aud,
      'title': 'Australian dollar'.tr,
      'code': 'AUD',
      'symbol': 'A\$',
      'KPW': 909.45,
      'USD': 0.69,
      'AUD': 1,
      'EUR': 0.68,
      'INR': 54.92
    },
    {
      'icon': svgAssets.kpw,
      'title': 'South Korean won'.tr,
      'code': 'KPW',
      'symbol': '₩',
      'KPW': 1,
      'USD': 0.00076,
      'AUD': 0.0011,
      'EUR': 0.00075,
      'INR': 0.060
    },
  ];

  //Time Filter type
  var timeFilterType = [];
}
