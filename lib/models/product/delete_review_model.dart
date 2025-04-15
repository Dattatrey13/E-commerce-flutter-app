/// success : true
/// message : "Deleted"
/// data : []

class DeleteReviewModel {
  DeleteReviewModel({
      bool? success, 
      String? message, 
      List<dynamic>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  DeleteReviewModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      // json['data'].forEach((v) {
      //   _data?.add(Dynamic.fromJson(v));
      // });
    }
  }
  bool? _success;
  String? _message;
  List<dynamic>? _data;

  bool? get success => _success;
  String? get message => _message;
  List<dynamic>? get data => _data;

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
