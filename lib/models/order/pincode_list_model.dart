class PincodeListModel {
  PincodeListModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  PincodeListModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  PincodeListModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      PincodeListModel(
        success: success ?? _success,
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

class Data {
  Data({
    List<String>? flatList,
    List<ListElement>? list,
  }) {
    _flatList = flatList;
    _list = list;
  }

  Data.fromJson(dynamic json) {
    _flatList = json['flat_list'] != null ? json['flat_list'].cast<String>() : [];
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(ListElement.fromJson(v));
      });
    }
  }

  List<String>? _flatList;
  List<ListElement>? _list;

  Data copyWith({
    List<String>? flatList,
    List<ListElement>? list,
  }) =>
      Data(
        flatList: flatList ?? _flatList,
        list: list ?? _list,
      );

  List<String>? get flatList => _flatList;

  List<ListElement>? get list => _list;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flat_list'] = _flatList;
    if (_list != null) {
      map['list'] = _list?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ListElement {
  ListElement({
    num? id,
    String? postcode,
    String? area,
    String? city,
    String? state,
    String? country,
    String? cashOnDelivery,
    num? deliveredInDays,
    String? orderNote,
    String? createdAt,
  }) {
    _id = id;
    _postcode = postcode;
    _area = area;
    _city = city;
    _state = state;
    _country = country;
    _cashOnDelivery = cashOnDelivery;
    _deliveredInDays = deliveredInDays;
    _orderNote = orderNote;
    _createdAt = createdAt;
  }

  ListElement.fromJson(dynamic json) {
    _id = json['id'];
    _postcode = json['postcode'];
    _area = json['area'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _cashOnDelivery = json['cash_on_delivery'];
    _deliveredInDays = json['delivered_in_days'];
    _orderNote = json['order_note'];
    _createdAt = json['created_at'];
  }

  num? _id;
  String? _postcode;
  String? _area;
  String? _city;
  String? _state;
  String? _country;
  String? _cashOnDelivery;
  num? _deliveredInDays;
  String? _orderNote;
  String? _createdAt;

  ListElement copyWith({
    num? id,
    String? postcode,
    String? area,
    String? city,
    String? state,
    String? country,
    String? cashOnDelivery,
    num? deliveredInDays,
    String? orderNote,
    String? createdAt,
  }) =>
      ListElement(
        id: id ?? _id,
        postcode: postcode ?? _postcode,
        area: area ?? _area,
        city: city ?? _city,
        state: state ?? _state,
        country: country ?? _country,
        cashOnDelivery: cashOnDelivery ?? _cashOnDelivery,
        deliveredInDays: deliveredInDays ?? _deliveredInDays,
        orderNote: orderNote ?? _orderNote,
        createdAt: createdAt ?? _createdAt,
      );

  num? get id => _id;

  String? get postcode => _postcode;

  String? get area => _area;

  String? get city => _city;

  String? get state => _state;

  String? get country => _country;

  String? get cashOnDelivery => _cashOnDelivery;

  num? get deliveredInDays => _deliveredInDays;

  String? get orderNote => _orderNote;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['postcode'] = _postcode;
    map['area'] = _area;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['cash_on_delivery'] = _cashOnDelivery;
    map['delivered_in_days'] = _deliveredInDays;
    map['order_note'] = _orderNote;
    map['created_at'] = _createdAt;
    return map;
  }
}
