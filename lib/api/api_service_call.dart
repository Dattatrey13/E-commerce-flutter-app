import 'dart:convert';
import 'dart:io';

import 'package:dapperz/api/api_config.dart';
import 'package:dapperz/api/app_exception.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiServiceCall implements BaseApi {
  // Map<String, String> getHeaders() {
  //   return {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': UserSingleton().token != null
  //         ? 'Bearer ${UserSingleton().token!}'
  //         : "",
  //     'Location': UserSingleton().selectedLocation != null
  //         ? UserSingleton().selectedLocation!.toLowerCase()
  //         : "",
  //     'session-key': UserSingleton().uuidForGuest != null
  //         ? UserSingleton().uuidForGuest!
  //         : UserSingleton().uuidFcm != null
  //             ? UserSingleton().uuidFcm!
  //             : "",
  //     'app': 'consumer',
  //     'is-mobile': 'true'
  //   };
  // }
  Map<String, String> getHeaders() {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'app': 'consumer',
      'is-mobile': 'true',
    };

    final token = UserSingleton().token;
    final guestUUID = UserSingleton().uuidForGuest;
    final fcmUUID = UserSingleton().uuidFcm;
    final location = UserSingleton().selectedLocation;

    if (token != null && token.isNotEmpty) {
      headers['Authorization'] =
      'Token $token'; // or 'Bearer' if your backend requires it
      print("Token Header: ${headers['Authorization']}");
    }

    if ((guestUUID != null && guestUUID.isNotEmpty) ||
        (fcmUUID != null && fcmUUID.isNotEmpty)) {
      headers['session-key'] =
      guestUUID?.isNotEmpty == true ? guestUUID! : fcmUUID!;
      print("Session-Key Header: ${headers['session-key']}");
    }else{
      print("Session Key is missing");
    }

    if (location != null && location.isNotEmpty) {
      headers['Location'] = location.toLowerCase();
    }

    return headers;
  }

  @override
  getResponse(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}$url'),
    
          headers: getHeaders());
            print("GetREsponse: $url");
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  postRequest(String url, params) async {
    dynamic responseJson;

    try {
      final response = await http.post(Uri.parse('${ApiConfig.baseUrl}$url'),
          headers: getHeaders(), body: jsonEncode(params));
      responseJson = returnResponse(response);
      print("Post Response in api_service: $responseJson");
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  getResponseWithNoToken(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}$url'));
      responseJson = returnResponse(response);
      print("Get Response in api_service: $responseJson");
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  postRequestWithNoToken(String url, params) async {
    dynamic responseJson;

    try {
      final response = await http.post(Uri.parse('${ApiConfig.baseUrl}$url'),
          headers: getHeaders(), body: jsonEncode(params));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  uploadImageWithDataRequest(String url, params, images) async {
    dynamic responseJson;
    var request =
        http.MultipartRequest('POST', Uri.parse('${ApiConfig.baseUrl}$url'));
    request.fields.addAll(params);
    if (images.isNotEmpty) {
      for (var element in images) {
        request.files
            .add(await http.MultipartFile.fromPath('reference_image', element));
      }
    }
    request.headers.addAll(getHeaders());

    http.StreamedResponse streamResponse = await request.send();
    var response = await http.Response.fromStream(streamResponse);
    responseJson = returnResponse(response);
    return responseJson;
  }

  @override
  deleteRequest(String url) async {
    dynamic responseJson;

    try {
      final response = await http.delete(Uri.parse('${ApiConfig.baseUrl}$url'),
          headers: getHeaders());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  patchRequest(String url, params) async {
    dynamic responseJson;

    try {
      final response = await http.patch(Uri.parse('${ApiConfig.baseUrl}$url'),
          headers: getHeaders(), body: jsonEncode(params));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) async {
    try {
      // Decode response body bytes
      String responseBody = utf8.decode(response.bodyBytes);
      String contentType = response.headers['content-type'] ?? '';

      // Check if the response content type is JSON
      if (contentType.contains('application/json')) {
        switch (response.statusCode) {
          case 200:
          case 201:
          case 400:
          case 500:
            return jsonDecode(responseBody);

          case 401:
            Fluttertoast.showToast(msg: "Session Expired");
            break;
          case 403:
            if (UserSingleton().token != null) {
              Fluttertoast.showToast(msg: "Session Expired");
            }
            AppController appCtrl = AppController();
            appCtrl.selectedIndex = 0;
            appCtrl.storage.erase();
            Get.forceAppUpdate();
            UserSingleton().token = null;
            UserSingleton().selectedLocation = null;
            Get.offAllNamed(routeName.login);
            break;
          case 404:
            Fluttertoast.showToast(msg: "Not Found");
            throw UnauthorisedException("404 Not Found: $responseBody");

          default:
            throw FetchDataException(
              'Error occurred while communicating with server. Status: ${response.statusCode}, Body: $responseBody',
            );
        }
      } else {
        // Handle non-JSON responses (e.g., plain text)
        print('Response body: $responseBody');
        throw FetchDataException(
            'Unexpected response format. Content-Type: $contentType');
      }
    } catch (e) {
      print("Error parsing response: $e");
      throw FetchDataException("Unknown response format or error: $e");
    }
  }
}
//   dynamic returnResponse(http.Response response) {
//     try {
//       final bodyString = utf8.decode(response.bodyBytes);
//
//       // Only attempt JSON parsing for certain status codes
//       switch (response.statusCode) {
//         case 200:
//         case 201:
//         case 400:
//         case 500:
//           try {
//             return jsonDecode(bodyString);
//           } catch (e) {
//             print("JSON parse error: $e");
//             throw FormatException("Invalid JSON response: $bodyString");
//           }
//         case 401:
//           Fluttertoast.showToast(msg: "Session Expired");
//           break;
//         case 403:
//           if (UserSingleton().token != null) {
//             Fluttertoast.showToast(msg: "Session Expired");
//           }
//           AppController appCtrl = AppController();
//           appCtrl.selectedIndex = 0;
//           appCtrl.storage.erase();
//           Get.forceAppUpdate();
//           UserSingleton().token = null;
//           UserSingleton().selectedLocation = null;
//           Get.offAllNamed(routeName.login);
//           break;
//         case 404:
//           Fluttertoast.showToast(msg: "Not Found");
//           throw UnauthorisedException("404 Not Found: $bodyString");
//         default:
//           throw FetchDataException(
//               'Error occurred while communicating with server. Status: ${response.statusCode}, Body: $bodyString'
//           );
//       }
//     } catch (e) {
//       print("Unhandled returnResponse error: $e");
//       throw FetchDataException("Unknown response format or error: $e");
//     }
//   }

