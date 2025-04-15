/// success : true
/// message : "Success"
/// data : {"max_price":405249,"min_price":0}

class FilterDataModel {
  FilterDataModel({
    bool? success,
    String? message,
    Data? data,}){
    _success = success;
    _message = message;
    _data = data;
  }

  FilterDataModel.fromJson(dynamic json) {
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

/// max_price : 405249
/// min_price : 0

class Data {
  Data({
    num? maxPrice,
    num? minPrice,}){
    _maxPrice = maxPrice;
    _minPrice = minPrice;
  }

  Data.fromJson(dynamic json) {
    _maxPrice = json['max_price'];
    _minPrice = json['min_price'];
  }
  num? _maxPrice;
  num? _minPrice;

  num? get maxPrice => _maxPrice;
  num? get minPrice => _minPrice;

  set maxPrice(dynamic value) {
    _maxPrice = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['max_price'] = _maxPrice;
    map['min_price'] = _minPrice;
    return map;
  }

}