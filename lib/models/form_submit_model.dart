
/// success : true
/// message : "Sent"
/// data : {}

class FormSubmitModel {
  FormSubmitModel({
    bool? success,
    String? message,
    dynamic data,}){
    _success = success;
    _message = message;
    _data = data;
  }

  FormSubmitModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'];
  }
  bool? _success;
  String? _message;
  dynamic _data;

  bool? get success => _success;
  String? get message => _message;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}