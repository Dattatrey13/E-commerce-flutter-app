abstract class BaseApi {
  dynamic getResponse(String url);

  dynamic getResponseWithNoToken(String url);

  dynamic postRequest(String url, dynamic params);

  dynamic postRequestWithNoToken(String url, dynamic params);

  dynamic uploadImageWithDataRequest(String url, dynamic params, List<String> images);

  /// new methods added
  dynamic deleteRequest(String s);

  dynamic patchRequest(String s, dynamic params);
}
