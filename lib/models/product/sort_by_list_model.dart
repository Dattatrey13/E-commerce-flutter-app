/// success : true
/// message : "Data retrieved successfully."
/// data : {"sort_by_list":[{"name":"Popularity","key":"popularity"},{"name":"Average Rating","key":"average_rating"},{"name":"Latest","key":"latest"},{"name":"Low to High","key":"low_to_high"},{"name":"High to Low","key":"high_to_low"}]}

class SortbyListModel {
  SortbyListModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  SortbyListModel.fromJson(dynamic json) {
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

/// sort_by_list : [{"name":"Popularity","key":"popularity"},{"name":"Average Rating","key":"average_rating"},{"name":"Latest","key":"latest"},{"name":"Low to High","key":"low_to_high"},{"name":"High to Low","key":"high_to_low"}]

class Data {
  Data({
    List<SortByList>? sortByList,
  }) {
    _sortByList = sortByList;
  }

  Data.fromJson(dynamic json) {
    if (json['sort_by_list'] != null) {
      _sortByList = [];
      json['sort_by_list'].forEach((v) {
        _sortByList?.add(SortByList.fromJson(v));
      });
    }
  }

  List<SortByList>? _sortByList;

  List<SortByList>? get sortByList => _sortByList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sortByList != null) {
      map['sort_by_list'] = _sortByList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "Popularity"
/// key : "popularity"

class SortByList {
  SortByList({
    String? name,
    String? key,
  }) {
    _name = name;
    _key = key;
  }

  SortByList.fromJson(dynamic json) {
    _name = json['name'];
    _key = json['key'];
  }

  String? _name;
  String? _key;

  String? get name => _name;

  String? get key => _key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['key'] = _key;
    return map;
  }
}
