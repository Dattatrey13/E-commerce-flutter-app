class CouponsListModel {
  CouponsListModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  CouponsListModel.fromJson(dynamic json) {
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

  CouponsListModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      CouponsListModel(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
      );

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

class Data {
  Data({
    num? id,
    String? code,
    String? amount,
    String? discountType,
    bool? freeShipping,
    bool? excludeSaleItems,
    num? minimumAmount,
    num? maximumAmount,
  }) {
    _id = id;
    _code = code;
    _amount = amount;
    _discountType = discountType;
    _freeShipping = freeShipping;
    _excludeSaleItems = excludeSaleItems;
    _minimumAmount = minimumAmount;
    _maximumAmount = maximumAmount;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _amount = json['amount'];
    _discountType = json['discount_type'];
    _freeShipping = json['free_shipping'];
    _excludeSaleItems = json['exclude_sale_items'];
    _minimumAmount = json['minimum_amount'];
    _maximumAmount = json['maximum_amount'];
  }

  num? _id;
  String? _code;
  String? _amount;
  String? _discountType;
  bool? _freeShipping;
  bool? _excludeSaleItems;
  num? _minimumAmount;
  num? _maximumAmount;

  Data copyWith({
    num? id,
    String? code,
    String? amount,
    String? discountType,
    bool? freeShipping,
    bool? excludeSaleItems,
    num? minimumAmount,
    num? maximumAmount,
  }) =>
      Data(
        id: id ?? _id,
        code: code ?? _code,
        amount: amount ?? _amount,
        discountType: discountType ?? _discountType,
        freeShipping: freeShipping ?? _freeShipping,
        excludeSaleItems: excludeSaleItems ?? _excludeSaleItems,
        minimumAmount: minimumAmount ?? _minimumAmount,
        maximumAmount: maximumAmount ?? _maximumAmount,
      );

  num? get id => _id;

  String? get code => _code;

  String? get amount => _amount;

  String? get discountType => _discountType;

  bool? get freeShipping => _freeShipping;

  bool? get excludeSaleItems => _excludeSaleItems;

  num? get minimumAmount => _minimumAmount;

  num? get maximumAmount => _maximumAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['amount'] = _amount;
    map['discount_type'] = _discountType;
    map['free_shipping'] = _freeShipping;
    map['exclude_sale_items'] = _excludeSaleItems;
    map['minimum_amount'] = _minimumAmount;
    map['maximum_amount'] = _maximumAmount;
    return map;
  }
}
