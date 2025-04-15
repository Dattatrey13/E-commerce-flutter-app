
/// is_success : true
/// data : {"id":2,"first_name":"hemant","last_name":"","email":"hemant.manglani01@gmail.com","phone_number":7698518963}
/// message : "Success"

class UserProfileModel {
  UserProfileModel({
    bool? isSuccess,
    Data? data,
    String? message,}){
    _isSuccess = isSuccess;
    _data = data;
    _message = message;
  }

  UserProfileModel.fromJson(dynamic json) {
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
/// first_name : "hemant"
/// last_name : ""
/// email : "hemant.manglani01@gmail.com"
/// phone_number : 7698518963

class Data {
  Data({
    num? id,
    String? firstName,
    String? lastName,
    String? email,
    num? phoneNumber,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phoneNumber = phoneNumber;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
  }
  num? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  num? _phoneNumber;

  num? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  num? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    return map;
  }

}