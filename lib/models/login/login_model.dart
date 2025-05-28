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
    _isSuccess = json['is_success'] ?? json['success'];
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

class Data {
  Data({
    String? refresh,
    String? access,
    String? username,
    UserData? userData,
    String? role,
  }) {
    _refresh = refresh;
    _access = access;
    _userData = userData;
    _username = username;
    _role = role;
  }

  Data.fromJson(dynamic json) {
    _refresh = json['refresh'];
    _access = json['access'];
    _userData = json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
    _role = json['role'];
    _username = json['username']; // <-- add this
  }

  String? _refresh;
  String? _access;
  String? _role;
  String? _username;
  UserData? _userData;


  String? get refresh => _refresh;

  String? get access => _access;

  String? get username => _username;

  UserData? get userData => _userData;

  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = _refresh;
    map['access'] = _access;
    map['username'] = _username;
    if (_userData != null) {
      map['user_data'] = _userData?.toJson();
    }
    map['role'] = _role;
    return map;
  }
}

class UserData {
  UserData({
    num? id,
    String? firstName,
    String? username,
    String? email,
    num? phoneNumber,
    String? countryCode,
    String? uuid,
    List<Roles>? roles,
  }) {
    _id = id;
    _firstName = firstName;
    _email = email;
    _username = username;
    _phoneNumber = phoneNumber;
    _countryCode = countryCode;
    _uuid = uuid;
    _roles = roles;
  }

  UserData.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _email = json['email'];
    _username = json['username'];
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
  String? _username;
  num? _phoneNumber;
  String? _countryCode;
  String? _uuid;
  List<Roles>? _roles;

  num? get id => _id;

  String? get firstName => _firstName;

  String? get email => _email;

  String? get username => _username;

  num? get phoneNumber => _phoneNumber;

  String? get countryCode => _countryCode;

  String? get uuid => _uuid;

  List<Roles>? get roles => _roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['email'] = _email;
    map['username'] = _username;
    map['phone_number'] = _phoneNumber;
    map['country_code'] = _countryCode;
    map['uuid'] = _uuid;
    if (_roles != null) {
      map['roles'] = _roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

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
