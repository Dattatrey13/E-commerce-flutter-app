/// success : true
/// message : "Success."
/// data : {
///   "id": 214,
///   "product_id": 15353,
///   "variation_id": null,
///   "quantity": 1,
///   "line_subtotal": 15728,
///   "line_total": 15728,
///   "line_tax": 2831.04,
///   "cgst_tax": 1415.52,
///   "sgst_tax": 1415.52,
///   "tax_class_id": 7,
///   "shipping_class_id": null,
///   "price": 15728.0
/// }

class AddCartModel {
  AddCartModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  AddCartModel.fromJson(dynamic json) {
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

class Data {
  Data({
    num? id,
    num? productId,
    dynamic variationId,
    num? quantity,
    num? lineSubtotal,
    num? lineTotal,
    num? lineTax,
    num? cgstTax,
    num? sgstTax,
    num? taxClassId,
    dynamic shippingClassId,
    num? price,
  }) {
    _id = id;
    _productId = productId;
    _variationId = variationId;
    _quantity = quantity;
    _lineSubtotal = lineSubtotal;
    _lineTotal = lineTotal;
    _lineTax = lineTax;
    _cgstTax = cgstTax;
    _sgstTax = sgstTax;
    _taxClassId = taxClassId;
    _shippingClassId = shippingClassId;
    _price = price;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _variationId = json['variation_id'];
    _quantity = json['quantity'];
    _lineSubtotal = json['line_subtotal'];
    _lineTotal = json['line_total'];
    _lineTax = json['line_tax'];
    _cgstTax = json['cgst_tax'];
    _sgstTax = json['sgst_tax'];
    _taxClassId = json['tax_class_id'];
    _shippingClassId = json['shipping_class_id'];
    _price = json['price'];
  }

  num? _id;
  num? _productId;
  dynamic _variationId;
  num? _quantity;
  num? _lineSubtotal;
  num? _lineTotal;
  num? _lineTax;
  num? _cgstTax;
  num? _sgstTax;
  num? _taxClassId;
  dynamic _shippingClassId;
  num? _price;

  num? get id => _id;
  num? get productId => _productId;
  dynamic get variationId => _variationId;
  num? get quantity => _quantity;
  num? get lineSubtotal => _lineSubtotal;
  num? get lineTotal => _lineTotal;
  num? get lineTax => _lineTax;
  num? get cgstTax => _cgstTax;
  num? get sgstTax => _sgstTax;
  num? get taxClassId => _taxClassId;
  dynamic get shippingClassId => _shippingClassId;
  num? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['variation_id'] = _variationId;
    map['quantity'] = _quantity;
    map['line_subtotal'] = _lineSubtotal;
    map['line_total'] = _lineTotal;
    map['line_tax'] = _lineTax;
    map['cgst_tax'] = _cgstTax;
    map['sgst_tax'] = _sgstTax;
    map['tax_class_id'] = _taxClassId;
    map['shipping_class_id'] = _shippingClassId;
    map['price'] = _price;
    return map;
  }
}
