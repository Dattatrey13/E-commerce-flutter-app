/// success : true
/// message : "Success"
/// data : {"unique_id":"bd19ed34-a43c-43ee-a9da-c942752a59a7","total_items":2,"total_quantity":2,"subtotal":2884,"total_tax":519.12,"total_cgst_tax":259.56,"total_sgst_tax":259.56,"total_discount":0,"total":2884,"applied_coupons":["hurry50"]}

class GetCartTotal {
  GetCartTotal({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetCartTotal.fromJson(dynamic json) {
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

/// unique_id : "bd19ed34-a43c-43ee-a9da-c942752a59a7"
/// total_items : 2
/// total_quantity : 2
/// subtotal : 2884
/// total_tax : 519.12
/// total_cgst_tax : 259.56
/// total_sgst_tax : 259.56
/// total_discount : 0
/// total : 2884
/// applied_coupons : ["hurry50"]

class Data {
  Data({
    String? uniqueId,
    num? totalItems,
    num? totalQuantity,
    num? subtotal,
    num? totalTax,
    num? totalCgstTax,
    num? totalSgstTax,
    num? totalDiscount,
    num? total,
    List<String>? appliedCoupons,
  }) {
    _uniqueId = uniqueId;
    _totalItems = totalItems;
    _totalQuantity = totalQuantity;
    _subtotal = subtotal;
    _totalTax = totalTax;
    _totalCgstTax = totalCgstTax;
    _totalSgstTax = totalSgstTax;
    _totalDiscount = totalDiscount;
    _total = total;
    _appliedCoupons = appliedCoupons;
  }

  Data.fromJson(dynamic json) {
    _uniqueId = json['unique_id'];
    _totalItems = json['total_items'];
    _totalQuantity = json['total_quantity'];
    _subtotal = json['subtotal'];
    _totalTax = json['total_tax'];
    _totalCgstTax = json['total_cgst_tax'];
    _totalSgstTax = json['total_sgst_tax'];
    _totalDiscount = json['total_discount'];
    _total = json['total'];
    _appliedCoupons = json['applied_coupons'] != null ? json['applied_coupons'].cast<String>() : [];
  }

  String? _uniqueId;
  num? _totalItems;
  num? _totalQuantity;
  num? _subtotal;
  num? _totalTax;
  num? _totalCgstTax;
  num? _totalSgstTax;
  num? _totalDiscount;
  num? _total;
  List<String>? _appliedCoupons;

  String? get uniqueId => _uniqueId;

  num? get totalItems => _totalItems;

  num? get totalQuantity => _totalQuantity;

  num? get subtotal => _subtotal;

  num? get totalTax => _totalTax;

  num? get totalCgstTax => _totalCgstTax;

  num? get totalSgstTax => _totalSgstTax;

  num? get totalDiscount => _totalDiscount;

  num? get total => _total;

  List<String>? get appliedCoupons => _appliedCoupons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['unique_id'] = _uniqueId;
    map['total_items'] = _totalItems;
    map['total_quantity'] = _totalQuantity;
    map['subtotal'] = _subtotal;
    map['total_tax'] = _totalTax;
    map['total_cgst_tax'] = _totalCgstTax;
    map['total_sgst_tax'] = _totalSgstTax;
    map['total_discount'] = _totalDiscount;
    map['total'] = _total;
    map['applied_coupons'] = _appliedCoupons;
    return map;
  }
}
