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

  @override
  getResponse(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}$url'),
          headers: getHeaders());
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
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        return responseJson;
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
      // throw UnauthorisedException(utf8.decode(response.bodyBytes));
      case 404:
        Fluttertoast.showToast(msg: "Not Found");
        throw UnauthorisedException(utf8.decode(response.bodyBytes));
      case 500:
        dynamic responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        return responseJson;
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
}
