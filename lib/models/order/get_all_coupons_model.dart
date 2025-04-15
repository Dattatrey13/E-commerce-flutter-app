/// success : true
/// message : "Success"
/// data : [{"id":75679,"code":"welcome10","amount":10.0,"discount_type":"percent"},{"id":50370,"code":"hurry50","amount":50.0,"discount_type":"fixed_cart"},{"id":50369,"code":"dapperz100","amount":100.0,"discount_type":"fixed_cart"},{"id":50368,"code":"cm200","amount":200.0,"discount_type":"fixed_cart"},{"id":50367,"code":"first10","amount":100.0,"discount_type":"fixed_cart"},{"id":74147,"code":"sika50","amount":5.75,"discount_type":"percent"}]

class GetAllCouponsModel {
  GetAllCouponsModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetAllCouponsModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  bool? _success;
  String? _message;
  List<Data>? _data;

  bool? get success => _success;

  String? get message => _message;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 75679
/// code : "welcome10"
/// amount : 10.0
/// discount_type : "percent"

class Data {
  Data({
    num? id,
    String? code,
    num? amount,
    String? discountType,
    String? couponsDesc,
  }) {
    _id = id;
    _code = code;
    _amount = amount;
    _discountType = discountType;
    _couponsDesc = couponsDesc;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _amount = json['amount'];
    _discountType = json['discount_type'];
    _couponsDesc = json['description'];
  }

  num? _id;
  String? _code;
  num? _amount;
  String? _discountType;
  String? _couponsDesc;

  num? get id => _id;

  String? get code => _code;

  num? get amount => _amount;

  String? get discountType => _discountType;

  String? get couponsDesc => _couponsDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['amount'] = _amount;
    map['discount_type'] = _discountType;
    map['description'] = _couponsDesc;
    return map;
  }
}
