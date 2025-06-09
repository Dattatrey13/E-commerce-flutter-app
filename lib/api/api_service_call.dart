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

  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': UserSingleton().token != null
          ? 'Bearer ${UserSingleton().token!}'
          : "",
      'Location': UserSingleton().selectedLocation != null
          ? UserSingleton().selectedLocation!.toLowerCase()
          : "",
      'session-key': UserSingleton().uuidForGuest != null
          ? UserSingleton().uuidForGuest!
          : UserSingleton().uuidFcm != null
              ? UserSingleton().uuidFcm!
              : "",
      'app': 'consumer',
      'is-mobile': 'true'
    };
  }

  // Map<String, String> getHeaders() {
  //   print('Token: ${UserSingleton().token}');
  //   print('Selected Location: ${UserSingleton().selectedLocation}');
  //   print('UUID For Guest: ${UserSingleton().uuidForGuest}');
  //   print('UUID FCM: ${UserSingleton().uuidFcm}');
  //
  //   final headers = {
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
  //         ? UserSingleton().uuidFcm!
  //         : "",
  //     'app': 'consumer',
  //     'is-mobile': 'true'
  //   };
  //
  //   print('Request Headers: $headers');
  //   print('======== API Headers ========');
  //   print('Authorization: Bearer ${UserSingleton().token}');
  //   print('Session-Key: ${UserSingleton().uuidForGuest ?? UserSingleton().uuidFcm}');
  //   print('Location: ${UserSingleton().selectedLocation}');
  //   print('Token saved in UserSingleton: ${UserSingleton().token}');
  //
  //   return headers;
  // }

  @override
  getResponse(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}$url'),

          headers: getHeaders());
            print("GetREsponse: $url");

      print("Session Key Header: ${UserSingleton().uuidForGuest ?? UserSingleton().uuidFcm ?? 'Not set'}");
      responseJson = await returnResponse(response);
      print("Get Response Service_call: $responseJson");
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
      responseJson = await returnResponse(response);
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
      responseJson = await returnResponse(response);
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
      responseJson = await returnResponse(response);
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
    responseJson = await returnResponse(response);
    return responseJson;
  }

  @override
  deleteRequest(String url) async {
    dynamic responseJson;

    try {
      final response = await http.delete(Uri.parse('${ApiConfig.baseUrl}$url'),
          headers: getHeaders());
      responseJson = await returnResponse(response);
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
      responseJson = await returnResponse(response);
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

          case 403:
            if (UserSingleton().token != null || response.statusCode == 401) {
              Fluttertoast.showToast(msg: "Session Expired");
              // AppController appCtrl = AppController();
              AppController appCtrl = Get.find<AppController>();
              appCtrl.selectedIndex = 0;
              appCtrl.storage.erase();
              UserSingleton().token != null;
              UserSingleton().selectedLocation != null;
              Get.offAllNamed(routeName.login);
            }
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
