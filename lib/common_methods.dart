import 'dart:typed_data';

import 'package:dapperz/config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// Future<List<File>?> getImagesPathFromGallery(int count) async {
//   List<Media>? res = await ImagePicker.pick(
//     count: count,
//     pickType: PickType.image,
//   );
//   List<File>? rotatedImage = [];
//   if (res != null) {
//     // Rotate the image to fix the wrong rotation coming from ImagePicker
//     for (var element in res) {
//       rotatedImage.add(await FlutterExifRotation.rotateImage(path: element.path));
//     }
//   }
//
//   return rotatedImage;
// }

final appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());

Future<XFile?> getImagesPathFromGallery() async {
  XFile? res = await ImagePicker().pickImage(source: ImageSource.gallery);
  return res;
}

Future<XFile?> getImagesPathFromCamera() async {
  XFile? res = await ImagePicker().pickImage(source: ImageSource.camera);
  return res;
}

String dateTimeForOrder(String date) {
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat("MMMM dd, yyyy").format(dateTime);
  return formattedDate;
}

showProgressDialog(bool isShow) {
  if (isShow) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: const Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          insetPadding: EdgeInsets.only(left: 100, right: 100),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Please Wait",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } else {
    Get.back();
  }
}

String getAWSS3BaseImageUrl(String fullUrl) {
  RegExp regExp = RegExp(r'(^[^?]+)');
  Match? match = regExp.firstMatch(fullUrl);
  return match?.group(1) ?? '';
}

bool isEmail(String email) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return emailValid;
}

String getNormalDate(String date) {
  DateTime parsedDate = DateTime.parse(date);
  return DateFormat('MMMM dd, yyyy, hh:mm a').format(parsedDate);
}

Future<void> launchURL(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
  0x42,
  0x60,
  0x82,
]);
