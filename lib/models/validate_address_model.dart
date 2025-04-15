/// success : true
/// message : "Success"
/// data : {"is_valid":false,"location":"ahmedabad"}

class ValidateAddressModel {
  ValidateAddressModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  ValidateAddressModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

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

/// is_valid : false
/// location : "ahmedabad"

class Data {
  Data({
    bool? isValid,
    String? location,
  }) {
    _isValid = isValid;
    _location = location;
  }

  Data.fromJson(dynamic json) {
    _isValid = json['is_valid'];
    _location = json['location'];
  }

  bool? _isValid;
  String? _location;

  bool? get isValid => _isValid;

  String? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_valid'] = _isValid;
    map['location'] = _location;
    return map;
  }
}
