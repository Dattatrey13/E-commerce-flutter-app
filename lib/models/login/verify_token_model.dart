/// is_success : true
/// data : {"is_expired":false}
/// message : "Valid"

class VerifyTokenModel {
  VerifyTokenModel({
    bool? isSuccess,
    Data? data,
    String? message,
  }) {
    _isSuccess = isSuccess;
    _data = data;
    _message = message;
  }

  VerifyTokenModel.fromJson(dynamic json) {
    _isSuccess = json['is_success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }

  bool? _isSuccess;
  Data? _data;
  String? _message;

  bool? get isSuccess => _isSuccess;

  Data? get data => _data;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_success'] = _isSuccess;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

/// is_expired : false

class Data {
  Data({
    bool? isExpired,
  }) {
    _isExpired = isExpired;
  }

  Data.fromJson(dynamic json) {
    _isExpired = json['is_expired'];
  }

  bool? _isExpired;

  bool? get isExpired => _isExpired;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_expired'] = _isExpired;
    return map;
  }
}
