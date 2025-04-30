/// success : true
/// message : "Created successfully"
/// data : {"id":106,"quantity":1,"session_id":"","original_price":"576 - 1145","wishlist_token":"A2iX3FWviDEa0-RfuBfrODVLPc6Yf-9c","created_at":"2024-09-10T10:42:05.519471","on_sale":true,"expiration":"2024-10-10T10:42:05.512089","product_id":79612,"user_id":null}

class AddToWishlistModel {
  AddToWishlistModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  AddToWishlistModel.fromJson(dynamic json) {
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
    num? id,
    num? quantity,
    String? sessionId,
    String? originalPrice,
    String? wishlistToken,
    String? createdAt,
    bool? onSale,
    dynamic expiration,
    num? slug,
    dynamic userId,
  }) {
    _id = id;
    _quantity = quantity;
    _sessionId = sessionId;
    _originalPrice = originalPrice;
    _wishlistToken = wishlistToken;
    _createdAt = createdAt;
    _onSale = onSale;
    _expiration = expiration;
    _slug = slug;
    _userId = userId;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _quantity = json['quantity'];
    _sessionId = json['session_id'];
    _originalPrice = json['original_price'];
    _wishlistToken = json['wishlist_token'];
    _createdAt = json['created_at'];
    _onSale = json['on_sale'];
    _expiration = json['expiration'];
    _slug = json['product_id'];
    _userId = json['user_id'];
  }

  num? _id;
  num? _quantity;
  String? _sessionId;
  String? _originalPrice;
  String? _wishlistToken;
  String? _createdAt;
  bool? _onSale;
  dynamic _expiration;
  num? _slug;
  dynamic _userId;

  num? get id => _id;

  num? get quantity => _quantity;

  String? get sessionId => _sessionId;

  String? get originalPrice => _originalPrice;

  String? get wishlistToken => _wishlistToken;

  String? get createdAt => _createdAt;

  bool? get onSale => _onSale;

  String? get expiration => _expiration;

  num? get slug => _slug;

  dynamic get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quantity'] = _quantity;
    map['session_id'] = _sessionId;
    map['original_price'] = _originalPrice;
    map['wishlist_token'] = _wishlistToken;
    map['created_at'] = _createdAt;
    map['on_sale'] = _onSale;
    map['expiration'] = _expiration;
    map['product_id'] = _slug;
    map['user_id'] = _userId;
    return map;
  }
}
