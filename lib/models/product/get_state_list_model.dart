/// success : true
/// message : "Success"
/// data : [{"id":1236,"parent_id":1235,"location_name":"Gujarat"},{"id":1275,"parent_id":1235,"location_name":"Uttar Pradesh"},{"id":1344,"parent_id":1235,"location_name":"Jharkhand"},{"id":1382,"parent_id":1235,"location_name":"Bihar"},{"id":1431,"parent_id":1235,"location_name":"Tripura"},{"id":1438,"parent_id":1235,"location_name":"Nagaland"},{"id":1453,"parent_id":1235,"location_name":"Mizoram"},{"id":1465,"parent_id":1235,"location_name":"Manipur"},{"id":1481,"parent_id":1235,"location_name":"Arunachal Pradesh"},{"id":1503,"parent_id":1235,"location_name":"Meghalaya"},{"id":1511,"parent_id":1235,"location_name":"Assam"},{"id":1536,"parent_id":1235,"location_name":"Odisha"},{"id":1568,"parent_id":1235,"location_name":"Andaman and Nicobar Islands"},{"id":1571,"parent_id":1235,"location_name":"Sikkim"},{"id":1576,"parent_id":1235,"location_name":"West Bengal"},{"id":1599,"parent_id":1235,"location_name":"Kerala"},{"id":1614,"parent_id":1235,"location_name":"Pondicherry (Puducherry)"},{"id":1617,"parent_id":1235,"location_name":"Tamil Nadu"},{"id":1650,"parent_id":1235,"location_name":"Karnataka"},{"id":1679,"parent_id":1235,"location_name":"Andhra Pradesh"},{"id":1693,"parent_id":1235,"location_name":"Telangana"},{"id":1704,"parent_id":1235,"location_name":"Chhattisgarh"},{"id":1725,"parent_id":1235,"location_name":"Madhya Pradesh"},{"id":1774,"parent_id":1235,"location_name":"Goa"},{"id":1777,"parent_id":1235,"location_name":"Daman and Diu"},{"id":1780,"parent_id":1235,"location_name":"Dadra and Nagar Haveli"},{"id":1782,"parent_id":1235,"location_name":"Maharashtra"},{"id":1817,"parent_id":1235,"location_name":"Rajasthan"},{"id":1851,"parent_id":1235,"location_name":"Uttarakhand"},{"id":1865,"parent_id":1235,"location_name":"Jammu and Kashmir"},{"id":1883,"parent_id":1235,"location_name":"Himachal Pradesh"},{"id":1896,"parent_id":1235,"location_name":"Chandigarh"},{"id":1898,"parent_id":1235,"location_name":"Punjab"},{"id":1925,"parent_id":1235,"location_name":"Delhi"},{"id":1935,"parent_id":1235,"location_name":"Haryana"}]

class GetStateListModel {
  GetStateListModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetStateListModel.fromJson(dynamic json) {
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

/// id : 1236
/// parent_id : 1235
/// location_name : "Gujarat"

class Data {
  Data({
      num? id, 
      num? parentId, 
      String? locationName,}){
    _id = id;
    _parentId = parentId;
    _locationName = locationName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _locationName = json['location_name'];
  }
  num? _id;
  num? _parentId;
  String? _locationName;

  num? get id => _id;
  num? get parentId => _parentId;
  String? get locationName => _locationName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_id'] = _parentId;
    map['location_name'] = _locationName;
    return map;
  }

}