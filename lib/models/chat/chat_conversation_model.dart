class ChatConversationModel {
  ChatConversationModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  ChatConversationModel.fromJson(dynamic json) {
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
    num? sender,
    num? recipient,
    String? content,
    String? timestamp,
    String? recipientFcmToken,
    String? senderFcmToken,
  }) {
    _id = id;
    _sender = sender;
    _recipient = recipient;
    _content = content;
    _timestamp = timestamp;
    _recipientFcmToken = recipientFcmToken;
    _senderFcmToken = senderFcmToken;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _sender = json['sender'];
    _recipient = json['recipient'];
    _content = json['content'];
    _timestamp = json['timestamp'];
    _recipientFcmToken = json['recipient_fcm_token'];
    _senderFcmToken = json['sender_fcm_token'];
  }

  num? _id;
  num? _sender;
  num? _recipient;
  String? _content;
  String? _timestamp;
  String? _recipientFcmToken;
  String? _senderFcmToken;

  num? get id => _id;

  num? get sender => _sender;

  num? get recipient => _recipient;

  String? get content => _content;

  String? get timestamp => _timestamp;

  String? get recipientFcmToken => _recipientFcmToken;

  String? get senderFcmToken => _senderFcmToken;


  set setId(num value) {
    _id = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sender'] = _sender;
    map['recipient'] = _recipient;
    map['content'] = _content;
    map['timestamp'] = _timestamp;
    map['recipient_fcm_token'] = _recipientFcmToken;
    map['sender_fcm_token'] = _senderFcmToken;
    return map;
  }
}
