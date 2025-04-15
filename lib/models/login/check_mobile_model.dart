/// is_success : true
/// data : {"is_exists":true}
/// message : "Success"

class CheckMobileModel {
  CheckMobileModel({
    bool? isSuccess,
    Data? data,
    String? message,}){
    _isSuccess = isSuccess;
    _data = data;
    _message = message;
  }

  CheckMobileModel.fromJson(dynamic json) {
    _isSuccess = json['is_success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _isSuccess;
  Data? _data;
  String? _message;
  CheckMobileModel copyWith({  bool? isSuccess,
    Data? data,
    String? message,
  }) => CheckMobileModel(  isSuccess: isSuccess ?? _isSuccess,
    data: data ?? _data,
    message: message ?? _message,
  );
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

/// is_exists : true

class Data {
  Data({
    bool? isExists,}){
    _isExists = isExists;
  }

  Data.fromJson(dynamic json) {
    _isExists = json['is_exists'];
  }
  bool? _isExists;
  Data copyWith({  bool? isExists,
  }) => Data(  isExists: isExists ?? _isExists,
  );
  bool? get isExists => _isExists;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_exists'] = _isExists;
    return map;
  }

}
