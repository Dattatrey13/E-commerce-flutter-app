class AddressListModel {
  AddressListModel({
    bool? isSuccess,
    List<Data>? data,
    String? message,
  }) {
    _isSuccess = isSuccess;
    _data = data;
    _message = message;
  }

  AddressListModel.fromJson(dynamic json) {
    _isSuccess = json['is_success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }

  bool? _isSuccess;
  List<Data>? _data;
  String? _message;

  bool? get isSuccess => _isSuccess;

  List<Data>? get data => _data;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_success'] = _isSuccess;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }
}

class Data {
  Data({
    num? id,
    String? companyName,
    dynamic gstNumber,
    dynamic address2,
    dynamic landmark,
    num? userId,
    String? firstName,
    String? lastName,
    String? city,
    String? state,
    String? country,
    String? phoneNumber,
    String? email,
    String? address1,
    String? pincode,
    bool? isDefault,
  }) {
    _id = id;
    _companyName = companyName;
    _gstNumber = gstNumber;
    _address2 = address2;
    _landmark = landmark;
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _city = city;
    _state = state;
    _country = country;
    _phoneNumber = phoneNumber;
    _email = email;
    _address1 = address1;
    _pincode = pincode;
    _isDefault = isDefault;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'];
    _gstNumber = json['gst_number'];
    _address2 = json['address_2'];
    _landmark = json['landmark'];
    _userId = json['user_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _phoneNumber = json['phone_number'];
    _email = json['email'];
    _address1 = json['address_1'];
    _pincode = json['pincode'];
    _isDefault = json['is_default'];
  }

  num? _id;
  String? _companyName;
  dynamic _gstNumber;
  dynamic _address2;
  dynamic _landmark;
  num? _userId;
  String? _firstName;
  String? _lastName;
  String? _city;
  String? _state;
  String? _country;
  String? _phoneNumber;
  String? _email;
  String? _address1;
  String? _pincode;
  bool? _isDefault;

  num? get id => _id;

  String? get companyName => _companyName;

  dynamic get gstNumber => _gstNumber;

  dynamic get address2 => _address2;

  dynamic get landmark => _landmark;

  num? get userId => _userId;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get city => _city;

  String? get state => _state;

  String? get country => _country;

  String? get phoneNumber => _phoneNumber;

  String? get email => _email;

  String? get address1 => _address1;

  String? get pincode => _pincode;

  bool? get isDefault => _isDefault;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_name'] = _companyName;
    map['gst_number'] = _gstNumber;
    map['address_2'] = _address2;
    map['landmark'] = _landmark;
    map['user_id'] = _userId;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['phone_number'] = _phoneNumber;
    map['email'] = _email;
    map['address_1'] = _address1;
    map['pincode'] = _pincode;
    map['is_default'] = _isDefault;
    return map;
  }
}
