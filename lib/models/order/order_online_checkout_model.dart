class OrderOnlineCheckoutModel {
  OrderOnlineCheckoutModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  OrderOnlineCheckoutModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null && json['data'].isNotEmpty ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  OrderOnlineCheckoutModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      OrderOnlineCheckoutModel(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get success => _success;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    String? accessKey,
    String? transactionId,
    String? testUrl,
  }) {
    _accessKey = accessKey;
    _transactionId = transactionId;
    _testUrl = testUrl;
  }

  Data.fromJson(dynamic json) {
    _accessKey = json['access_token'];
    _transactionId = json['transaction_id'];
    _testUrl = json['test_url'];
  }

  String? _accessKey;
  String? _transactionId;
  String? _testUrl;

  Data copyWith({
    String? accessKey,
    String? transactionId,
    String? testUrl,
  }) =>
      Data(
        accessKey: accessKey ?? _accessKey,
        transactionId: transactionId ?? _transactionId,
        testUrl: testUrl ?? _testUrl,
      );

  String? get accessKey => _accessKey;

  String? get transactionId => _transactionId;

  String? get testUrl => _testUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_key'] = _accessKey;
    map['header_token'] = _transactionId;
    map['test_url'] = _testUrl;
    return map;
  }
}
