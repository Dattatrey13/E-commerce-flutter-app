class ApplyCouponModel {
  ApplyCouponModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  ApplyCouponModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null && json['data'].isNotEmpty ? Data.fromJson(json['data']) : null;
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

class Data {
  Data({
    dynamic totalDiscount,
    num? newCartTotal,
    List<String>? couponError,
    String? message,
  }) {
    _totalDiscount = totalDiscount;
    _newCartTotal = newCartTotal;
    _couponError = couponError;
    _message = message;
  }

  Data.fromJson(dynamic json) {
    _totalDiscount = json['total_discount'];
    _newCartTotal = json['new_cart_total'];
    if (json['coupon_error'] != null) {
      _couponError = [];
      json['coupon_error'].forEach((v) {
        _couponError?.add(v);
      });
    }
    _message = json['message'];
  }

  num? _totalDiscount;
  num? _newCartTotal;
  List<String>? _couponError;
  String? _message;

  num? get totalDiscount => _totalDiscount;

  num? get newCartTotal => _newCartTotal;

  List<dynamic>? get couponError => _couponError;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_discount'] = _totalDiscount;
    map['new_cart_total'] = _newCartTotal;
    if (_couponError != null) {
      map['coupon_error'] = _couponError?.map((v) => v).toList();
    }
    map['message'] = _message;
    return map;
  }
}
