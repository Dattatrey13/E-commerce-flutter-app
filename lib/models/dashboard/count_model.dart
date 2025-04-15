/// success : true
/// message : "Data retrieved successfully."
/// data : {"total":2}

class CountModel {
  CountModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CountModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
CountModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => CountModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
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

/// total : 2

class Data {
  Data({
      num? total,}){
    _total = total;
}

  Data.fromJson(dynamic json) {
    _total = json['total'];
  }
  num? _total;
Data copyWith({  num? total,
}) => Data(  total: total ?? _total,
);
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    return map;
  }

}