/// success : true
/// message : "Success"
/// data : [{"id":1288,"location_name":"Ahmedabad","children":[]},{"id":1289,"location_name":"Amreli","children":[]},{"id":1290,"location_name":"Anand","children":[]},{"id":1291,"location_name":"Banaskantha","children":[]},{"id":1293,"location_name":"Bharuch","children":[]},{"id":1295,"location_name":"Bhavnagar","children":[]},{"id":1296,"location_name":"Dahod","children":[]},{"id":1297,"location_name":"Gandhinagar","children":[]},{"id":1298,"location_name":"Jamnagar","children":[]},{"id":1299,"location_name":"Junagadh","children":[]},{"id":1300,"location_name":"Kachchh","children":[]},{"id":1301,"location_name":"Kheda","children":[]},{"id":1302,"location_name":"Navsari","children":[]},{"id":1303,"location_name":"Panch Mahals","children":[]},{"id":1304,"location_name":"Patan","children":[]},{"id":1305,"location_name":"Porbandar","children":[]},{"id":1306,"location_name":"Surendra Nagar","children":[]},{"id":1307,"location_name":"Dang","children":[]},{"id":1308,"location_name":"Mahesana","children":[]},{"id":1309,"location_name":"Narmada","children":[]},{"id":1310,"location_name":"Rajkot","children":[]},{"id":1311,"location_name":"Sabarkantha","children":[]},{"id":1312,"location_name":"Vadodara","children":[]},{"id":1313,"location_name":"Valsad","children":[]},{"id":1237,"location_name":"Surat","children":[]}]

class GetCityListModel {
  GetCityListModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetCityListModel.fromJson(dynamic json) {
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

/// id : 1288
/// location_name : "Ahmedabad"
/// children : []

class Data {
  Data({
    num? id,
    String? locationName,
  }) {
    _id = id;
    _locationName = locationName;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _locationName = json['location_name'];
  }

  num? _id;
  String? _locationName;

  num? get id => _id;

  String? get locationName => _locationName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['location_name'] = _locationName;
    return map;
  }
}
