import 'package:dapperz/config.dart';

var profileList = <ProfileModel>[
  // ProfileModel(icon: svgAssets.mode, title: 'Mode', subTitle: ''),
  // ProfileModel(icon: svgAssets.rtl,title: 'RTL',subTitle: ''),
  // ProfileModel(icon: svgAssets.order, title: 'Pages', subTitle: 'Elements & Other Pages'),
  ProfileModel(
      icon: Icons.reorder,
      title: 'Orders',
      subTitle: 'Ongoing Orders, Recent Orders..'),
  ProfileModel(
      icon: Icons.favorite_border,
      title: 'Your Wishlist',
      subTitle: 'Your Save Products'),
  // ProfileModel(icon: svgAssets.wallet, title: 'Payment', subTitle: 'Saved Cards, Wallets'),
  ProfileModel(
      icon: Icons.location_on_outlined,
      title: 'Saved Address',
      subTitle: 'Billing, Shipping.. '),
  // ProfileModel(icon: svgAssets.flags, title: 'Language', subTitle: 'Select your Language here..'),
  // ProfileModel(icon: svgAssets.currency, title: 'Currency Change', subTitle: 'Select your Currency here..'),
  // ProfileModel(icon: svgAssets.notification, title: 'Notification', subTitle: 'Offers, Order tracking messages..'),
  // ProfileModel(icon: svgAssets.setting, title: 'Settings', subTitle: 'App settings, Dark mode'),
  ProfileModel(
      icon: Icons.account_circle,
      title: 'Profile setting',
      subTitle: 'Full Name, Last Name..'),
  ProfileModel(
      icon: Icons.notes,
      title: 'Terms & Conditions',
      subTitle: 'T&C for use of Platform'),
  ProfileModel(
      icon: Icons.question_answer,
      title: 'FAQs',
      subTitle: 'Customer Queries, FAQs'),
  ProfileModel(
      icon: Icons.privacy_tip_sharp,
      title: 'Privacy Policy',
      subTitle: 'This privacy policy has been..'),
  ProfileModel(
      icon: Icons.money,
      title: 'Refund and Returns Policy',
      subTitle: 'This Returns and Cancellation..'),
  ProfileModel(
      icon: Icons.local_shipping,
      title: 'Shipping Policy',
      subTitle: 'Thanks for shopping at dapperz..'),
  ProfileModel(
      icon: Icons.info_outline,
      title: 'About dapperz',
      subTitle: 'Surat\'s premium source for top quality..'),
];

var guestProfileList = <ProfileModel>[
  ProfileModel(
      icon: Icons.favorite_border,
      title: 'Your Wishlist',
      subTitle: 'Your Save Products'),
  ProfileModel(
      icon: Icons.notes,
      title: 'Terms & Conditions',
      subTitle: 'T&C for use of Platform'),
  ProfileModel(
      icon: Icons.question_answer,
      title: 'FAQs',
      subTitle: 'Customer Queries, FAQs'),
  ProfileModel(
      icon: Icons.privacy_tip_sharp,
      title: 'Privacy Policy',
      subTitle: 'This privacy policy has been..'),
  ProfileModel(
      icon: Icons.money,
      title: 'Refund and Returns Policy',
      subTitle: 'This Returns and Cancellation..'),
  ProfileModel(
      icon: Icons.local_shipping,
      title: 'Shipping Policy',
      subTitle: 'Thanks for shopping at dapperz..'),
  ProfileModel(
      icon: Icons.info_outline,
      title: 'About dapperz',
      subTitle: 'Surat\'s premium source for top quality..'),
];
