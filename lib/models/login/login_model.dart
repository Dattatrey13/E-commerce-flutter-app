/// is_success : true
/// data : {"refresh":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyODMyNjEzOSwiaWF0IjoxNzI1NzM0MTM5LCJqdGkiOiJiOWJiNjMwYzc0ZDc0YzI1YWExZGVmMjRjNjgzN2Q2NSIsInVzZXJfaWQiOjMxfQ.Wy_3OCwhcO3aZUgEUUGQHJWmflrQKzz_i8qRjfeeCQI","access":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI2NTk4MTM5LCJpYXQiOjE3MjU3MzQxMzksImp0aSI6Ijg4NjA1MjQ5NDFkZTQ5MWQ4YjQ4ZjFjNTZjNmFkMzMwIiwidXNlcl9pZCI6MzF9.j4TViYgicqrjOJT6WnCLsNcR-PfNP2-WpUKzey_60-U","user_data":{"id":31,"first_name":"rishi","email":"","phone_number":7048704208,"country_code":"+91","uuid":"Xkz15tzd9XTqNABBsjsbxTdcQDY2","roles":[{"id":2,"name":"consumer"}]}}
/// message : "Login successful!"

class LoginModel {
  LoginModel({
    bool? isSuccess,
    Data? data,
    String? message,
  }) {
    _isSuccess = isSuccess;
    _data = data;
    _message = message;
  }

  LoginModel.fromJson(dynamic json) {
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

/// refresh : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyODMyNjEzOSwiaWF0IjoxNzI1NzM0MTM5LCJqdGkiOiJiOWJiNjMwYzc0ZDc0YzI1YWExZGVmMjRjNjgzN2Q2NSIsInVzZXJfaWQiOjMxfQ.Wy_3OCwhcO3aZUgEUUGQHJWmflrQKzz_i8qRjfeeCQI"
/// access : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI2NTk4MTM5LCJpYXQiOjE3MjU3MzQxMzksImp0aSI6Ijg4NjA1MjQ5NDFkZTQ5MWQ4YjQ4ZjFjNTZjNmFkMzMwIiwidXNlcl9pZCI6MzF9.j4TViYgicqrjOJT6WnCLsNcR-PfNP2-WpUKzey_60-U"
/// user_data : {"id":31,"first_name":"rishi","email":"","phone_number":7048704208,"country_code":"+91","uuid":"Xkz15tzd9XTqNABBsjsbxTdcQDY2","roles":[{"id":2,"name":"consumer"}]}

class Data {
  Data({
    String? refresh,
    String? access,
    UserData? userData,
  }) {
    _refresh = refresh;
    _access = access;
    _userData = userData;
  }

  Data.fromJson(dynamic json) {
    _refresh = json['refresh'];
    _access = json['access'];
    _userData = json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }

  String? _refresh;
  String? _access;
  UserData? _userData;

  String? get refresh => _refresh;

  String? get access => _access;

  UserData? get userData => _userData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = _refresh;
    map['access'] = _access;
    if (_userData != null) {
      map['user_data'] = _userData?.toJson();
    }
    return map;
  }
}

/// id : 31
/// first_name : "rishi"
/// email : ""
/// phone_number : 7048704208
/// country_code : "+91"
/// uuid : "Xkz15tzd9XTqNABBsjsbxTdcQDY2"
/// roles : [{"id":2,"name":"consumer"}]

class UserData {
  UserData({
    num? id,
    String? firstName,
    String? email,
    num? phoneNumber,
    String? countryCode,
    String? uuid,
    List<Roles>? roles,
  }) {
    _id = id;
    _firstName = firstName;
    _email = email;
    _phoneNumber = phoneNumber;
    _countryCode = countryCode;
    _uuid = uuid;
    _roles = roles;
  }

  UserData.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _countryCode = json['country_code'];
    _uuid = json['uuid'];
    if (json['roles'] != null) {
      _roles = [];
      json['roles'].forEach((v) {
        _roles?.add(Roles.fromJson(v));
      });
    }
  }

  num? _id;
  String? _firstName;
  String? _email;
  num? _phoneNumber;
  String? _countryCode;
  String? _uuid;
  List<Roles>? _roles;

  num? get id => _id;

  String? get firstName => _firstName;

  String? get email => _email;

  num? get phoneNumber => _phoneNumber;

  String? get countryCode => _countryCode;

  String? get uuid => _uuid;

  List<Roles>? get roles => _roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['country_code'] = _countryCode;
    map['uuid'] = _uuid;
    if (_roles != null) {
      map['roles'] = _roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// name : "consumer"

class Roles {
  Roles({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Roles.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  num? _id;
  String? _name;

  num? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
