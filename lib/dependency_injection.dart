import 'package:dapperz/config.dart';
import 'package:dapperz/controllers/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
