import '../../config.dart';

class SettingController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  var settingData = <ProfileModel>[
    ProfileModel(icon: Icons.settings, title: 'Mode'.tr, subTitle: 'Change Dark to Light Mode'),
    // ProfileModel(icon: svgAssets.setting, title: 'RTL'.tr, subTitle: ''),
    ProfileModel(icon: Icons.notifications, title: 'Notification'.tr, subTitle: 'Offers, Order tracking messages..'.tr),
  ];
}
