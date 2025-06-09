import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:collection';
import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:dapperz/utilities/uni_links_service.dart';
import 'package:dapperz/views/chat/chat_screen.dart';
import 'package:dapperz/views/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'common/language/index.dart';


FirebaseAuth? auth;
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
AwesomeNotifications? awesomeNotifications;

@pragma('vm:entry-point')
Future<void> myBackgroundMessageHandler(RemoteMessage message) async {}

@pragma('vm:entry-point')
Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
  var data = receivedAction.payload;
  final storage = GetStorage();
  String? regularToken = storage.read(Session.isRegularLoginToken);
  UserSingleton().isGuest = false;
  UserSingleton().token = regularToken;
  UserSingleton().selectedLocation = storage.read(Session.locationName);
  Future.delayed(const Duration(milliseconds: 200), () {
    if (data!['type'] == "ORDER") {
      HashMap<String, dynamic> params = HashMap();
      params['id'] = receivedAction.payload!['order_id'];
      params['is_cancelable'] =
          bool.parse(receivedAction.payload!['is_cancelable'] ?? "false");
      Get.toNamed(routeName.orderDetail,
          arguments: params, preventDuplicates: false);
    } else if (data['type'] == "QUOTATION_FROM_VENDOR") {
      // Move to vendor list
      HashMap<String, dynamic> params = HashMap();
      params['id'] = receivedAction.payload!['quotation_id'];
      params['name'] = receivedAction.payload!['quotation_vendor_name'];
      Get.toNamed(routeName.quoteDetail, arguments: params);
    } else if (data['type'] == "VENDOR_MESSAGE") {
      // Move to vendor message
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => ChatScreen(
            id: receivedAction.payload!['vendor_id'],
            name: receivedAction.payload!['vendor_name'],
          ),
        ),
      );
    } else if (data['type'] == "SUPPORT_MESSAGE") {
      // Move to support message
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => ChatScreen(
            id: receivedAction.payload!['support_id'],
            name: "Civilis Smart Support",
          ),
        ),
      );
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await handlePermission();
  awesomeNotifications = AwesomeNotifications();
  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  await getFcmToken();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  auth = FirebaseAuth.instance;
  Get.put(AppController());
  await UniLinksService.init();
  await initialize();
  // await requestPermission();
  runApp(MyApp());
}


handlePermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

Future<void> getFcmToken() async {
  UserSingleton().fcmToken = (Platform.isIOS
      ? await FirebaseMessaging.instance.getAPNSToken()
      : await FirebaseMessaging.instance.getToken())!;
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
}

Future<void> requestPermission() async {
  await Permission.notification.request();
}

Future<void> initialize() async {
  await awesomeNotifications!.initialize(
    // set the icon to null if you want to use the default app icon
    "resource://mipmap/ic_launcher",
    [
      NotificationChannel(
        channelGroupKey: 'message_group',
        channelKey: 'message_channel',
        channelName: 'Messaging',
        channelDescription: 'Message Notification Channel',
        defaultColor: const Color(0xFFFDE613),
        playSound: true,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        ledColor: Colors.white,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        locked: true,
      )
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: 'message_group', channelGroupName: 'dapperz')
    ],
    debug: false,
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    listen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    lockScreenPortrait();
    return ScreenUtilInit(
      designSize: Size(size.shortestSide, size.longestSide),
      builder: (_, child) => GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        translations: Language(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        title: CommonTextFont().dapperz,
        home: const SplashScreen(),
        getPages: appRoute.getPages,
        theme: AppTheme.fromType(ThemeType.light).themeData,
        darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
        themeMode: ThemeService().theme,
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: widget!,
          );
        },
      ),
    );
  }

  lockScreenPortrait() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
  }

  void listen() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) async {
      await notification(event);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      Map message = event.toMap();
      var payload = message['data'];
      await awesomeNotifications!.createNotification(
        content: NotificationContent(
          id: 11,
          channelKey: 'message_channel',
          title: payload['title'],
          body: payload['body'],
          category: NotificationCategory.Social,
          notificationLayout: NotificationLayout.Messaging,
          payload: {
            "type": payload['type'],
            "id": payload['id'],
            // Vendor Message
            "user_id": payload['vendor_id'],
            "user_name": payload['vendor_name'],
            // Order Detail
            "quotation_id": payload['quotation_id'],
            "quotation_vendor_name": payload['quotation_vendor_name'],
            // Quote Detail
            "order_id": payload['order_id'],
            "is_cancelable": payload['is_cancelable'],
            // SUPPORT Message
            "support_id": payload['support_id']
          },
        ),
      );
    });
  }
}

Future<void> notification(RemoteMessage event) async {
  Map message = event.toMap();
  var payload = message['data'];
  final storage = GetStorage();
  String? regularToken = storage.read(Session.isRegularLoginToken);
  UserSingleton().isGuest = false;
  UserSingleton().token = regularToken;
  UserSingleton().selectedLocation = storage.read(Session.locationName);
  await Future.delayed(const Duration(seconds: 2));
  if (payload!['type'] == "ORDER") {
    HashMap<String, dynamic> params = HashMap();
    params['id'] = payload!['order_id'];
    params['is_cancelable'] = bool.parse(payload!['is_cancelable'] ?? "false");
    Get.toNamed(routeName.orderDetail,
        arguments: params, preventDuplicates: false);
  } else if (payload['type'] == "QUOTATION_FROM_VENDOR") {
    // Move to vendor list
    HashMap<String, dynamic> params = HashMap();
    params['id'] = payload!['quotation_id'];
    params['name'] = payload!['quotation_vendor_name'];
    Get.toNamed(routeName.quoteDetail, arguments: params);
  } else if (payload['type'] == "VENDOR_MESSAGE") {
    // Move to vendor message
    navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          id: payload!['vendor_id'],
          name: payload!['vendor_name'],
        ),
      ),
    );
  } else if (payload['type'] == "SUPPORT_MESSAGE") {
    // Move to support message
    navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          id: payload!['support_id'],
          name: "Dapperz Support",
        ),
      ),
    );
  }
}
