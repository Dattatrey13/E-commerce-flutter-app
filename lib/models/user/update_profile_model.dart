/// is_success : true
/// data : {"id":2,"first_name":"Hemant","last_name":"Manglani"}
/// message : "Success"

class UpdateProfileModel {
  UpdateProfileModel({
    bool? isSuccess,
    Data? data,
    String? message,}){
    _isSuccess = isSuccess;
    _data = data;
    _message = message;
  }

  UpdateProfileModel.fromJson(dynamic json) {
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

/// id : 2
/// first_name : "Hemant"
/// last_name : "Manglani"

class Data {
  Data({
    dynamic id,
    String? firstName,
    String? lastName,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
  }

  dynamic _id;
  String? _firstName;
  String? _lastName;

  dynamic get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    return map;
  }

}