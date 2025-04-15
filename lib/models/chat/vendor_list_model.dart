class VendorListModel {
  VendorListModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  VendorListModel.fromJson(dynamic json) {
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

class Data {
  Data({
    num? id,
    String? firstName,
    String? lastName,
    num? unreadCount,
    String? fcmToken,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _unreadCount = unreadCount;
    _fcmToken = fcmToken;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _unreadCount = json['unread_count'];
    _fcmToken = json['fcm_token'];
  }

  num? _id;
  String? _firstName;
  String? _lastName;
  num? _unreadCount;
  String? _fcmToken;

  num? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  num? get unreadCount => _unreadCount;

  String? get fcmToken => _fcmToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['unread_count'] = _unreadCount;
    map['fcm_token'] = _fcmToken;
    return map;
  }
}
