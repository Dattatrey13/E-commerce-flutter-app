import 'package:dapperz/config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  bool isRouteOpen = false;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      isRouteOpen = true;
      Get.toNamed(routeName.noInternetConnection);
    } else {
      if (isRouteOpen) {
        isRouteOpen = false;
        Get.back();
      }
    }
  }
}
