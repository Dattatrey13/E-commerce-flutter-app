import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

class UniLinksService {
  static String _productId = '';

  static String get promoId => _productId;

  static bool get hasPromoId => _productId.isNotEmpty;

  static void reset() => _productId = '';

  static Future<void> init({checkActualVersion = false}) async {
    // This is used for cases when: APP is not running and the user clicks on a link.
    try {
      final Uri? uri = await getInitialUri();
      _uniLinkHandler(uri: uri);
    } on PlatformException {
      if (kDebugMode)
        print("(PlatformException) Failed to receive initial uri.");
    }

    // This is used for cases when: APP is already running and the user clicks on a link.
    uriLinkStream.listen((Uri? uri) async {
      _uniLinkHandler(uri: uri);
    }, onError: (error) {
      if (kDebugMode) print('UniLinks onUriLink error: $error');
    });
  }

  static Future<void> _uniLinkHandler({required Uri? uri}) async {
    if (uri == null || uri.queryParameters.isEmpty) return;
    Map<String, String> params = uri.queryParameters;

    String receivedProductId = params['product-id'] ?? '';
    if (receivedProductId.isEmpty) return;
    _productId = receivedProductId;

    UserSingleton().redirectProductPage = true;
    UserSingleton().productId = _productId;

    Get.toNamed(routeName.productDetail,
        arguments: _productId, preventDuplicates: false);
  }
}
