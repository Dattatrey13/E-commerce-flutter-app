import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

class UniLinksService {
  static String _slug = '';

  static String get promoId => _slug;

  static bool get hasPromoId => _slug.isNotEmpty;

  static void reset() => _slug = '';

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

    String receivedslug = params['product-id'] ?? '';
    if (receivedslug.isEmpty) return;
    _slug = receivedslug;

    UserSingleton().redirectProductPage = true;
    UserSingleton().slug = _slug;

    Get.toNamed(routeName.productDetail,
        arguments: _slug, preventDuplicates: false);
  }
}
